import argparse
from score_utils import count_inter_score

def parse_args():
	parser = argparse.ArgumentParser()
	parser.add_argument(
		"--ruleset",
		type=str,
		nargs='?',
		default="../data/fw filters/MyFilters1k_1.txt",
		help="Path to ClassBench ruleset file",
	)
	return parser.parse_args()


if __name__ == '__main__':
	""" Load rules from ClassBench filter file, build a graph,
	and print graph statistics """
	args = parse_args()
	score = count_inter_score(args.ruleset, 1000, 1000) # change to change the intervals, more interval result in more time & more accuracy
	print("weight of current ruleset: {}".format(score))
