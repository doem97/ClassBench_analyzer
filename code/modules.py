import numpy as np

class Rule:
	def __init__(self):
		self.raw_str = None
		self.timestamp = 0
		self.priority = 0
		self.tcam_priority = 0
		self.index = 0

	def __str__(self):
		rule_str = (
			str(self.index)
			+ "\t0\t"  # flag, not used here
			+ str(self.tcam_priority)
			+ "\t0\t0\t0\t0\t"  # low_cost, low_cost_idx, high_cost, high_cost_idx
			+ "\t".join(
				list(
					map(
						str,
						[
							self.sip_low,
							self.sip_high,
							self.dip_low,
							self.dip_high,
							self.sp_low,
							self.sp_high,
							self.dp_low,
							self.dp_high,
							self.protocol_val,
							self.protocol_mask,
							self.priority,
						],
					)
				)
			)
			+ "\t%.9f" % self.timestamp
		)
		return rule_str

	__repr__ = __str__

	def from_str(self, rule_str):
		# format
		# [0] flag priority position low_cost low_cost_idx
		# (cont.) [5] high_cost high_cost_idx sip_low sip_high
		# (cont.) [9] dip_low dip_high sp_low sp_high dp_low dp_high
		# (cont.) [15] protocol_val protocol_mask
		tok = rule_str.strip().split("\t")
		self.raw_str = rule_str.strip()
		self.tcam_priority = int(tok[1])
		self.sip_low = int(tok[7])
		self.sip_high = int(tok[8])
		self.dip_low = int(tok[9])
		self.dip_high = int(tok[10])
		self.sp_low = int(tok[11])
		self.sp_high = int(tok[12])
		self.dp_low = int(tok[13])
		self.dp_high = int(tok[14])
		self.protocol_val = int(tok[15])
		self.protocol_mask = int(tok[16])


class NetworkTrafficModel:
	def __init__(self):
		self.t = 0.

	def set_start_time(self, t):
		self.t = t

	def reset(self):
		self.t = 0.

	def next(self):
		raise NotImplementedError()


class PoissonNTM(NetworkTrafficModel):
	def __init__(self, pr, seed=None):
		""" Initialize Poisson Network Traffic Model
		Parameters
		----------
		pr: float
			packet rate
		seed: int
			random seed """
		super(PoissonNTM, self).__init__()
		self.k = 1. / pr
		# set random seed
		if seed is not None:
			np.random.seed(seed)
		# pre-compute some intervals
		self.N = 1000  # number of pre-computed elements
		self.interval_pt = 0
		self.intervals = np.random.exponential(scale=self.k, size=self.N)

	def next(self):
		# TODO: be aware of numerical issue caused by floating point precision
		self.t += self.intervals[self.interval_pt]

		self.interval_pt += 1
		if self.interval_pt >= self.N:
			self.intervals = np.random.exponential(scale=self.k, size=self.N)
			self.interval_pt = 0

		return self.t
