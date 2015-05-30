#!/usr/bin/env bash
cat pr > tmp/pr_temp
hadoop fs -put nodes

for i in `seq 1 10`
do
	echo $i
	cat tmp/pr_temp
	hadoop fs -rm -r pr_temp tmp tmp2
	hadoop fs -put tmp/pr_temp

	hadoop jar /usr/local/Cellar/hadoop/2.6.0/libexec/share/hadoop/tools/lib/hadoop-streaming-2.6.0.jar \
		-mapper sortMapper.py \
		-reducer sortReducer.py \
		-file sortMapper.py \
		-file sortReducer.py \
		-input pr_temp \
		-input nodes \
		-output tmp

	hadoop jar /usr/local/Cellar/hadoop/2.6.0/libexec/share/hadoop/tools/lib/hadoop-streaming-2.6.0.jar \
		-mapper prMapper.py \
		-reducer prReducer.py \
		-file prMapper.py \
		-file prReducer.py \
		-input tmp/part-00000 \
		-output tmp2

	rm tmp/pr$i
	hadoop fs -get tmp2/part-00000 tmp/pr$i
	cat tmp/pr$i > tmp/pr_temp
done
