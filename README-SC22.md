# miniVite IndySCC22

## Code modification

- Picked Tsinghua University Team's SCC20 optimization patch for remote node communication
- Switched from RB-tree based set to hashset as the program doesn't require any ordered set property
- Replaced STL hashmap/hashset with a more optimized hashset/hashmap library, ankerl::unordered_dense::{map, set}

It is entirely feasible, but we don't think it's worth the effort, to further optimize locks and parallelization. 
