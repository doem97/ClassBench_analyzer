import argparse
import ipaddress
import os
import networkx as nx

from networkx.algorithms.cluster import average_clustering
from networkx.algorithms.components import *
from networkx.algorithms.dag import (dag_longest_path_length,
									 is_directed_acyclic_graph)
import networkx.algorithms.approximation as approx
from networkx.algorithms.connectivity import node_connectivity, edge_connectivity

from modules import Rule
from utils import construct_graph
import numpy as np
import random


def parse_args():
	parser = argparse.ArgumentParser()
	parser.add_argument(
		"--ruleset",
		type=str,
		nargs='?',
		default="./filters/acl filters/MyFilters1k_1.txt",
		help="Path to ClassBench ruleset file",
	)
	return parser.parse_args()

def load_ruleset(fname, except_zero = True, random_priority = 0):
	""" Load ruleset from ClassBench filter file """
	"""
	(expect_zero = True): due to zero nodes(0.0.0.0/n) causes huge computing resource, you can exclude all zero nodes here.
	(random_priorit = n): from 0 to n. if n = 0, use the sequence of the ruleset as each rule's priority.
	"""
	ruleset = []
	with open(fname, 'r') as f:
		for n, line in enumerate(f):
			# LINE FORMAT
			# @sip_network dip_network sp_low : sp_high dp_low: dp_high protocal/protocol_mask xxx/xxx
			tok = line.strip().split('\t')
			rule = Rule()
			sip = ipaddress.ip_network(tok[0][1:])
			dip = ipaddress.ip_network(tok[1])
			sp = tok[2].split(':')
			dp = tok[3].split(':')
			protocol = tok[4].split('/')
			
			if except_zero:
				if int(sip[0]) == 0 or int(dip[0]) == 0:
					continue
			#sip[0] : given a IP/mask, upper bound of IP address
			#sip[-1] : given a IP/mask, lower bound of IP address
			rule.sip_low = int(sip[0])
			rule.sip_high = int(sip[-1])
			rule.dip_low = int(dip[0])
			rule.dip_high = int(dip[-1])
			rule.sp_low, rule.sp_high = int(sp[0]), int(sp[1])
			rule.dp_low, rule.dp_high = int(dp[0]), int(dp[1])
			rule.protocol_val, rule.protocol_mask = int(protocol[0], 16), int(protocol[1], 16)

			if random_priority:
				rule.priority = int(random.randint(0, random_priority))
			else:
				rule.priority = n
			ruleset.append(rule)
	return ruleset

def all_path_lenth(graph):
	paths_len = []
	for idx_s in [idx for idx,i in enumerate(list(dict(G.in_degree()).values())) if (i == 0 and G.out_degree(idx) != 0)]:
		for idx_d in [idx for idx,i in enumerate(list(dict(G.out_degree()).values())) if (i == 0 and G.in_degree(idx) != 0)]:
			if nx.has_path(G,idx_s, idx_d):
				l = list(nx.all_simple_paths(G, source=idx_s, target=idx_d))
				paths_len.append(len(l))
			else:
				continue
	return np.array(paths_len)


if __name__ == '__main__':
	""" Load rules from ClassBench filter file, build a graph,
	and print graph statistics """
	args = parse_args()

	ruleset = load_ruleset(args.ruleset, except_zero = False, random_priority = 0)

	# build graph
	G = construct_graph(ruleset, True)
	
	# every nodes' (in degree, out degree)
	node_degree = []
	node_list = list(G.nodes())
	for idx, i in enumerate(node_list):
		node_degree.append((G.in_degree(i), G.out_degree(i)))

	
	"""Calculation of nodes and edges"""
	# number of edges of each component
	edge_num_by_component = []
	weak_list = list(nx.weakly_connected_components(G))
	
	for idx, k in enumerate(weak_list):
		#if len(k) != 1:
		#	edge_num_by_component.append(len(list(G.edges(weak_list[idx]))))
		edge_num_by_component.append(len(list(G.edges(weak_list[idx]))))
	
	# paths
	paths_len = []
	#paths_len = all_path_lenth(G)

	

	#dump info into file 
	temp = args.ruleset.split('/')
	with open("path_len_" + temp[-1], "w") as f:
	#with open("./path_lenth.txt", "w") as f:
		
		# graph statistics
		print('========Graph Statistics========', file = f)

		#print('--------Nodes & Edges--------', file = f)
		print('#node:\t', G.number_of_nodes(), file = f)
		print("number of isolated nodes: \t", len([k for k in list(nx.weakly_connected_components(G)) if (len(k)==1)]), file = f)
		percentage = len([k for k in list(nx.weakly_connected_components(G)) if (len(k)==1)]) / G.number_of_nodes()
		print("percentage of isolated nodes: \t", percentage,file = f)
		print('#edge:\t', G.number_of_edges(), file = f)

		#print('--------Connectivity--------', file = f)
		print('Is weakly connected:\t', is_weakly_connected(G), file = f)
		print('#weakly connected component:\t', number_weakly_connected_components(G), file = f)
		print('Is strongly connected:\t', is_strongly_connected(G), file = f)
		print('#strongly connected component:\t', number_strongly_connected_components(G), file = f)
		
		print('#node in largest SCC:\t', len(next(strongly_connected_components(G))), file = f)
		print('#node in largest WCC:\t', len(next(weakly_connected_components(G))), file = f)
		print('node connectivity (approx.):\t', approx.node_connectivity(G.to_undirected()), file = f)
		
		# exact, slow
		# print('node connectivity:', node_connectivity(G.to_undirected()))
		# print('edge connectivity:', edge_connectivity(G.to_undirected()))

		#print('------------DAG-------------', file = f)
		print('Is DAG (should be true):\t', is_directed_acyclic_graph(G), file = f)
		print('Longest path length:\t', dag_longest_path_length(G), file = f)

		#print('--------Clustering--------')
		# exact, slow
		# print('Average clustering coefficient (undirected):', average_clustering(G.to_undirected()))
		# approximate, fast
		print('Average clustering coefficient (undirected, approx.):\t', approx.average_clustering(G.to_undirected()), file = f)
		
		
		
		
		
		# reprint in  the file  \t \t \t \t \t 
		print ("\n\n\n\n", file = f)
		#---------Nodes & Edges--------'
		print(G.number_of_nodes(), end = "\t", file = f) 
		print(len([k for k in list(nx.weakly_connected_components(G)) if (len(k)==1)]), end = "\t", file = f)
		print(percentage, end = "\t",file = f)

		print(G.number_of_edges(), end = "\t", file = f)
		#--------Connectivity--------
		print(is_weakly_connected(G), end = "\t", file = f)
		print(number_weakly_connected_components(G), end = "\t", file = f)
		print(is_strongly_connected(G), end = "\t", file = f)
		print(number_strongly_connected_components(G), end = "\t", file = f)
		#node in largest SCC:
		print(len(next(strongly_connected_components(G))), end = "\t", file = f)
		##node in largest WCC
		print(len(next(weakly_connected_components(G))), end = "\t", file = f)
		print(approx.node_connectivity(G.to_undirected()), end = "\t", file = f)

		#------------DAG-------------
		print(is_directed_acyclic_graph(G), end = "\t", file = f)
		print(dag_longest_path_length(G), end = "\t", file = f)

		#--------Clustering--------
		#Average clustering coefficient (undirected, approx.):
		print(approx.average_clustering(G.to_undirected()), end = "\n\n\n", file = f)

		
		
		print("all nodes' (in degree tab out degree) are: \n", file = f)
		for value in node_degree:
			print (value[0], end = "\t", file =f )
			print (value[1], end = "\n", file =f )
			
		
		print('\n\n----------weakly connected Component info ---------',file = f)
		#print("node numbers of each component are: \n", [len(n) for n in [k for k in weak_list if (len(k) != 1)]], file = f)
		print("node numbers of each component are: \n", [len(n) for n in [k for k in weak_list ]], file = f)
		print("\n\n edge numbers of each component are: \n", file = f)
		for index, value  in enumerate(edge_num_by_component):
			print (value, file = f)
		##################################################################################################################################
		
		#print info of all the simple path. Huge calucation time !!!!!!
		if ( len(paths_len) ):
			print(np.mean(paths_len), end = "\t", file = f),
			print(np.max(paths_len), end = "\t", file = f)
			print(np.median(paths_len), end = "\n\n\n\n", file = f)

			print(paths_len, "\n", file = f)

			for index, value in enumerate(paths_len):
				print(value, file = f)
			print("Average length of paths is:", np.mean(paths_len))
			print("Max length of paths is:", np.max(paths_len))
			print("Median length of paths is:", np.median(paths_len))
		
		else:
			print ("paths_len is empty  ")

