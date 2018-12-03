import numpy as np
import ipaddress
import math
from modules import Rule
import random
from collections import defaultdict
import networkx as nx

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

def cut2points(ruleset):
    sip = []
    dip = []
    sp = []
    dp = []
    for i in ruleset:
        sip.append(i.sip_low)
        sip.append(i.sip_high)
        dip.append(i.dip_low)
        dip.append(i.dip_high)
        if i.sp_low == i.sp_high:
            sp.append(i.sp_low)
            sp.append(i.sp_high+1)
        else:
            sp.append(i.sp_low)
            sp.append(i.sp_high)
        if i.dp_low == i.dp_high:
            dp.append(i.dp_low)
            dp.append(i.dp_high+1)
        else:
            dp.append(i.dp_low)
            dp.append(i.dp_high)
    return sorted(set(sip)), sorted(set(dip)), sorted(set(sp)), sorted(set(dp))

def cut2points_mosaic(ruleset, sip_interval, dip_interval):
    # interval means the number of intervals
    sip = []
    dip = []
    sp = []
    dp = []
    ip_total = 2**32
    sip_interval_range = 2**32/sip_interval
    dip_interval_range = 2**32/dip_interval
    temp = 0
    for i in range(sip_interval+1):
        temp = i*sip_interval_range
        sip.append(temp)
    temp = 0
    for i in range(dip_interval+1):
        temp = i*dip_interval_range
        dip.append(temp)
    for i in ruleset:
        if i.sp_low == i.sp_high:
            sp.append(i.sp_low)
            sp.append(i.sp_high+1)
        else:
            sp.append(i.sp_low)
            sp.append(i.sp_high)
        if i.dp_low == i.dp_high:
            dp.append(i.dp_low)
            dp.append(i.dp_high+1)
        else:
            dp.append(i.dp_low)
            dp.append(i.dp_high)
    return sorted(set(sip)), sorted(set(dip)), sorted(set(sp)), sorted(set(dp))
    
        
def list2mapping(a):
    mapping = {}
    for i,v in enumerate(a):
        mapping[v] = i
    return mapping

def get_point_index(rule,sip_map, dip_map, sp_map, dp_map):
    sip_low = sip_map[rule.sip_low]
    sip_high = sip_map[rule.sip_high]
    dip_low = dip_map[rule.dip_low]
    dip_high = dip_map[rule.dip_high]
    sp_low = sp_map[rule.sp_low]
    sp_high = sp_map[rule.sp_high]
    dp_low = dp_map[rule.dp_low]
    dp_high = dp_map[rule.dp_high]
    return sip_low, sip_high, dip_low, dip_high, sp_low, sp_high, dp_low, dp_high

def get_point_index_mosaic(rule, sip_interval_range, dip_interval_range, sp_map, dp_map):
    sip_low = rule.sip_low//int(sip_interval_range)
    sip_high = rule.sip_high//int(sip_interval_range)
    if rule.sip_high%sip_interval_range:
        sip_high += 1
    dip_low = rule.dip_low//int(dip_interval_range)
    dip_high = rule.dip_high//int(dip_interval_range)
    if rule.dip_high%dip_interval_range:
        dip_high += 1
    sp_low = sp_map[rule.sp_low]
    sp_high = sp_map[rule.sp_high]
    dp_low = dp_map[rule.dp_low]
    dp_high = dp_map[rule.dp_high]
    return sip_low, sip_high, dip_low, dip_high, sp_low, sp_high, dp_low, dp_high

def reverse_map(dict_ori):
    dict_new = {value:key for key,value in dict_ori.items()}
    return dict_new

def count_inter_score(filepath, sip_interval, dip_interval):
    ruleset = load_ruleset(filepath, False)
    sip, dip, sp, dp = cut2points_mosaic(ruleset, sip_interval, dip_interval) # returns a set
    sip_interval_range = 2**32/sip_interval
    dip_interval_range = 2**32/dip_interval
    sip_len = len(sip)
    dip_len = len(dip)
    sp_len = len(sp)
    dp_len = len(dp)
    sp_map = list2mapping(sp)
    dp_map = list2mapping(dp)
    sp_re_map = reverse_map(sp_map)
    dp_re_map = reverse_map(dp_map)

    """this cell using numpy function to construct a extra-huge space and the dimension is based on previous cutting"""
    space = np.zeros((sip_len-1, dip_len-1, sp_len-1, dp_len-1), dtype=np.uint8) # sip_len-1 is intervals
    for i in ruleset:
        sip_low, sip_high, dip_low, dip_high, sp_low, sp_high, dp_low, dp_high = get_point_index_mosaic(i, sip_interval_range, dip_interval_range, sp_map, dp_map)
        # print("{} {} {} {} {} {} {} {}".format(sip_low, sip_high, dip_low, dip_high, sp_low, sp_high, dp_low, dp_high))
        space[sip_low:sip_high, dip_low:dip_high, sp_low:sp_high+1, dp_low:dp_high+1] += 1
        # this is the main problem where sp_low:sp_high may be 4:4 and means nothing. Here I use sp_low:sp_high+1, which means 4:5 
        # hit the 4:4 rule, and 14:15 hits the 14:14 rule.
        
    hit_mat = space
    sip_range, dip_range, sp_range, dp_range = hit_mat.shape[0], hit_mat.shape[1], hit_mat.shape[2], hit_mat.shape[3]
    volume = np.zeros((sip_range, dip_range, sp_range, dp_range), dtype = np.float32)
    ip_cube_volume = sip_interval_range*dip_interval_range
    for index in np.ndindex(sp_range, dp_range):
        volume[:,:,index[0]:index[0]+1, index[1]:index[1]+1] = math.log(ip_cube_volume*(sp_re_map[index[0]+1]-sp_re_map[index[0]])*(dp_re_map[index[1]+1]-dp_re_map[index[1]]))
    np.multiply(hit_mat, volume, out = volume)
    weight = np.sum(volume)/len(ruleset)
    return weight