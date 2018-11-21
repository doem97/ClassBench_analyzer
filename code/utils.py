import json
import os
import random
from collections import defaultdict

import numpy as np
import networkx as nx
from networkx.readwrite import json_graph

from modules import Rule


def save_json_graph(G, path="visualization/graph.json", save_labels=True):
	""" Save graph in json format, for D3 visualization
	To run D3 visualization, go to the directory where graph.json is saved,
	run python -m http.server

	Parameters
	----------
	G: nx.Graph / nx.DiGraph
		A networkx graph
	path: str
		Path to saved json file
	save_labels: bool
		Save labels or not """
	if save_labels is False:
		for n in G:
			G.nodes[n]["name"] = 0
			G.nodes[n]["priority"] = 0
	else:
		for n in G:
			G.nodes[n]["name"] = int(n)
			G.nodes[n]["label"] = int(G.nodes[n]["priority"])
			G.nodes[n]["priority"] = int(G.nodes[n]["priority"])
	d = json_graph.node_link_data(G)
	json.dump(d, open(path, "w"))


def split_ruleset(original, pick_every_k=10, seed=None):
	"""Split original rule set to initial set and update set
	Parameters
	----------
	original: list
		original rule set
	pick_every_k: int
		pick every k'th element to update set
	seed: int
		random seed
	
	Return
	---------
	initial_set: list
		initial rule set
	update_set: list
		update rule set"""
	initial_set = original[::pick_every_k]
	update_set = [original[i] for i in range(len(original)) if i % pick_every_k != 0]
	if seed is not None:
		random.seed(seed)
	random.shuffle(update_set)
	return initial_set, update_set


def ensure_dir(dir):
	if not os.path.exists(dir):
		os.makedirs(dir)


def load_rules(fname):
	""" Load rule set from file
	Parameters
	----------
	fname: str
		rule set file name

	Return
	----------
	rules: list
		list of rules"""
	rules = []
	idx = 0
	with open(fname, "r") as f:
		for line in f:
			# line format (tab delimited)
			# flag priority position low_cost low_cost_idx
			# (cont.) high_cost high_cost_idx sip_low sip_high
			# (cont.) dip_low dip_high sp_low sp_high dp_low dp_high
			# (cont.) protocol_val protocol_mask
			rule = Rule()
			rule.from_str(line)
			rule.index = idx
			rules.append(rule)
			idx += 1
	return rules


def save_rules(fname, ruleset):
	with open(fname, "w") as f:
		for rule in ruleset:
			f.write(str(rule) + "\n")


def assign_timestamp(ruleset, ntm):
	""" Assign timestamps for ruleset in place
	Parameters
	----------
	ruleset: list
		Rule set. Should be a list of Rule objects
	ntm: NetworkTrafficModel
		Network traffic model used to generate timestamps """
	for rule in ruleset:
		rule.timestamp = ntm.next()


def assign_timestamp_batch(ruleset, ntm, batch_size):
	""" Assign timestamps for ruleset in place, batch-wise
	Parameters
	----------
	ruleset: list
		Rule set. Should be a list of Rule objects
	ntm: NetworkTrafficModel
		Network traffic model used to generate timestamps
	batch_size: int
		Batch size """
	for i in range(len(ruleset)):
		if i % batch_size == 0:
			t = ntm.next()
		ruleset[i].timestamp = t


def assign_priority(ruleset, dist, seed=None):
	""" Assign priority values for ruleset in place
	Parameters
	----------
	ruleset: list
		Rule set. Should be a list of Rule objects
	dist: list
		Probability distribution of priority values. For example,
		[0.2, 0.5, 0.3] corresponds to a multinomial distribution
		on priority values 1, 2 ,3 """
	if seed is not None:
		np.random.seed(seed)
	dist_normalized = np.array(dist) / np.sum(dist)
	pvalues = (
		np.random.choice(len(dist_normalized), len(ruleset), p=dist_normalized) + 1
	)
	for i, rule in enumerate(ruleset):
		rule.priority = pvalues[i]


def gen_search_trace(update_ruleset, ntm):
	""" Generate TCAM search trace, and match with update trace
	We should guarantee that the time span of search trace is matched with update trace
	Parameters
	----------
	update_ruleset: list
		List of update trace
	ntm: NetworkTrafficModel
		Network traffic model to generate timestamps
	
	Return
	----------
	search_trace: list
		List of search trace, each element is a timestamp value """
	t_end = update_ruleset[-1].timestamp
	t_begin = update_ruleset[0].timestamp
	search_trace = []
	# TODO: numerical issue of timestamps caused by floating point precision
	t = t_begin
	while t < t_end:
		t = ntm.next()
		search_trace.append(t)
	return search_trace


def save_search_trace(fname, search_trace):
	""" Save search trace to file
	Each line should be of (op_idx op_timestamp)
	Parameters
	----------
	fname: str
		file name to save search trace
	search_trace: list
		List of search trace. Each element is a timestamp """
	with open(fname, "w") as f:
		for i, ts in enumerate(search_trace):
			f.write("{}\t{:.9f}\n".format(i, ts))


def rule_intersect(rule_a, rule_b):
	""" Decide if two rules intersect """
	sip_intersect = (
		rule_a.sip_high >= rule_b.sip_low and rule_b.sip_high >= rule_a.sip_low
	)
	dip_intersect = (
		rule_a.dip_high >= rule_b.dip_low and rule_b.dip_high >= rule_a.dip_low
	)
	sp_intersect = rule_a.sp_high >= rule_b.sp_low and rule_b.sp_high >= rule_a.sp_low
	dp_intersect = rule_a.dp_high >= rule_b.dp_low and rule_b.dp_high >= rule_a.dp_low
	return sip_intersect and dip_intersect and sp_intersect and dp_intersect

def rule_space(rule):
	return int((rule.sip_high - rule.sip_low)*(rule.dip_high - rule.dip_low)*(rule.sp_high - rule.sp_low)*(rule.dp_high - rule.dp_low))

def construct_graph(ruleset, save=False):
	""" Construct a relevance graph from ruleset
	Parameters
	----------
	ruleset: list
		list of rules
	save: bool
		save graph to json file or not
	
	Return
	----------
	G: nx.DiGraph
		a networkx graph """
	G = nx.DiGraph()
	for i, rule in enumerate(ruleset):
		#print(i)
		#print(rule.priority)
		G.add_node(i, priority=rule.priority)
 # we use naive approach to find all intersections
	for i, rule_i in enumerate(ruleset):
		for j in range(i + 1, len(ruleset)):
			rule_j = ruleset[j]
			rule_i_space = rule_space(rule_i)
			rule_j_space = rule_space(rule_j)
			if rule_intersect(rule_i, rule_j):
				if rule_i.priority > rule_j.priority:
					G.add_edge(i, j)
				elif rule_i.priority < rule_j.priority:
					G.add_edge(j, i)
				elif rule_i.priority == rule_j.priority:
					if rule_i_space > rule_j_space:
						G.add_edge(j, i)
					elif rule_i_space < rule_j_space:
						G.add_edge(i, j)
					elif rule_i_space == rule_j_space:
						G.add_edge(i, j)
			else:
				continue
	if save:
		save_json_graph(G)
	return G


def parse_packet_drop(output):
	""" Parse packet drop from simulator C module output
	Parameters
	----------
	output: str
		Output captured from simulator
		
	Returns
	----------
	(#search packet drop, #update packet drop)"""
	line = output[output.find("Lookup packet drop") :]
	tok = line.strip().split("\t")
	search_drop = int(tok[0].split()[-1])
	update_drop = int(tok[1].split()[-1])
	return search_drop, update_drop


def parse_latency(search_log, update_log):
	""" Parse search & update request latency
	Parameters
	----------
	search_log: str
		File name of search log
	update_log: str
		File name of update log
	
	Returns
	----------
	(search_latency_stats, update_latency_stats)
		Each of the element is a list. Each element of the list
		is of (index, latency) """
	search_latency = []
	with open(search_log, "r") as f:
		for line in f:
			idx, _, start, end = line.strip().split()
			idx = int(idx)
			start, end = float(start), float(end)
			if end > 0:  # exclude dropped packets
				search_latency.append((idx, end - start))

	update_latency = []
	latency = defaultdict(lambda: [0, 0])
	with open(update_log, "r") as f:
		for line in f:
			idx, _, start, end = line.strip().split()
			idx = int(idx)
			start, end = float(start), float(end)
			if end > 0:
				latency[idx][0] = start
				latency[idx][1] = max(latency[idx][1], end)
	for idx, lat in latency.items():
		update_latency.append((idx, lat[1] - lat[0]))
	return search_latency, update_latency
