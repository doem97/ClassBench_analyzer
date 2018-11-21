#!/bin/bash
for i in {1..10}
do
    python ./ruleset_util.py --ruleset ../output/acl\ filters/MyFilters${i}k_1.cmp
done
