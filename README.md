# PageRank-Hadoop

[PageRank](http://en.wikipedia.org/wiki/PageRank) Implementation in MapReduce. Calculate PageRank with Hadoop Streaming.


### Files
`nodes`: Nodes with their links. 

`pr`: Nodes with their initial PageRanks.

`sortMapper.py`, `sortReducer`: Actually does little things, but just sort outputs.

`prMapper.py`: Maps node to its contributed rank from nodes it is linked from.

`prReduce.py`: Reduces and calculate new PageRanks.

`config.py`: `N` is the number of nodes. `alpha` is the damping factor and is usualy set to 0.85.


### Run test
`./test`

### Run with Hadoop Streaming
`./hadoop-run`
