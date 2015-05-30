#!/usr/bin/env bash
times=20
cat pr > tmp/pr_temp
for i in `seq 1 $times`
do
	echo $i
	cat tmp/pr_temp
	cat nodes tmp/pr_temp | ./sortMapper.py | sort | ./sortReducer.py | ./prMapper.py | sort | ./prReducer.py > tmp/pr_temp
	echo '---------'
done
