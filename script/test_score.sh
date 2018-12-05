# acl
# change the size
echo "acl"
echo "change size from 1K to 10K"
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 1000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 2000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 3000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 4000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 5000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 6000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 7000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 8000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 9000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt

echo "change random from 2 to 64"
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 4 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 8 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 16 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 32 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 64 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt

echo "change address scope from -1.0 to 1.0"
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 -1.0 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 -0.9 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 -0.8 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 -0.7 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 -0.6 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 -0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 -0.4 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 -0.3 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 -0.2 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 -0.1 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.0 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.1 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.2 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.3 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.4 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.6 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.7 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.8 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.9 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 1.0 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt

echo "change application from -1.0 to 1.0"
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 -1.0 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 -0.9 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 -0.8 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 -0.7 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 -0.6 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 -0.5 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 -0.4 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 -0.3 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 -0.2 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 0.0 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 0.2 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 0.3 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 0.4 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 0.5 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 0.6 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 0.7 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 0.8 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 0.9 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/acl1_seed 10000 2 0.5 1.0 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt

# fw
echo "fw"
echo "change size from 1K to 10K"
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 1000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 2000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 3000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 4000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 5000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 6000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 7000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 8000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 9000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt

echo "change random from 2 to 64"
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 4 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 8 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 16 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 32 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 64 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt

echo "change address scope from -1.0 to 1.0"
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 -1.0 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 -0.9 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 -0.8 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 -0.7 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 -0.6 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 -0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 -0.4 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 -0.3 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 -0.2 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 -0.1 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.0 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.1 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.2 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.3 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.4 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.6 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.7 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.8 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.9 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 1.0 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt

echo "change application from -1.0 to 1.0"
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 -1.0 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 -0.9 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 -0.8 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 -0.7 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 -0.6 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 -0.5 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 -0.4 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 -0.3 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 -0.2 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 0.0 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 0.2 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 0.3 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 0.4 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 0.5 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 0.6 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 0.7 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 0.8 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 0.9 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/fw1_seed 10000 2 0.5 1.0 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt

# ipc
echo "ipc"
echo "change size from 1K to 10K"
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 1000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 2000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 3000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 4000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 5000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 6000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 7000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 8000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 9000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt

echo "change random from 2 to 64"
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 4 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 8 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 16 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 32 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 64 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt

echo "change address scope from -1.0 to 1.0"
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 -1.0 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 -0.9 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 -0.8 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 -0.7 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 -0.6 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 -0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 -0.4 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 -0.3 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 -0.2 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 -0.1 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.0 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.1 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.2 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.3 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.4 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.6 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.7 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.8 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.9 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 1.0 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt

echo "change application from -1.0 to 1.0"
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 -1.0 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 -0.9 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 -0.8 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 -0.7 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 -0.6 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 -0.5 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 -0.4 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 -0.3 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 -0.2 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 -0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 0.0 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 0.1 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 0.2 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 0.3 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 0.4 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 0.5 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 0.6 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 0.7 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 0.8 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 0.9 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
../code/db_generator/db_generator -bc ../code/parameter_files/ipc1_seed 10000 2 0.5 1.0 ../data/temp_filter.txt
python ../code/count_score.py --ruleset ../data/temp_filter.txt
