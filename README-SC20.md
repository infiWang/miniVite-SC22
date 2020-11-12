# Mystery App

## Code modification

We have made some code modifications:

1. For vertices with low degree, we use a custom implmentation of `distBuildLocalMapCounter` and `distGetMaxIndex` based on stack local array and linear scan lookup. This can work better than hash maps when the map size is small.
2. We use sorting to replace hashmap for other cases.

We only modified the Louvain algorithm, and result correctness is assured by correct modularity.
