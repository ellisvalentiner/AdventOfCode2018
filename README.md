# AdventOfCode2018

[![Build Status](https://travis-ci.org/ellisvalentiner/AdventOfCode2018.jl.svg?branch=master)](https://travis-ci.org/ellisvalentiner/AdventOfCode2018.jl)

[![Coverage Status](https://coveralls.io/repos/ellisvalentiner/AdventOfCode2018.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/ellisvalentiner/AdventOfCode2018.jl?branch=master)

[![codecov.io](http://codecov.io/github/ellisvalentiner/AdventOfCode2018.jl/coverage.svg?branch=master)](http://codecov.io/github/ellisvalentiner/AdventOfCode2018.jl?branch=master)



## Performance

````julia
print(performance)
````


| Day        | Memory (MiB) | Allocations | Min. Time (ms) | Median Time (ms) | Mean Time (ms) | Max. Time (ms) | Samples |
|:---------- | ------------:| -----------:| --------------:| ----------------:| --------------:| --------------:| -------:|
| 1          |         5.75 |        2168 |           6.49 |            8.812 |          9.068 |         68.878 |     551 |
| 2          |        17.83 |       15554 |            2.6 |             4.77 |          4.551 |           55.1 |    1097 |
| 3          |         74.1 |       49556 |         73.164 |          141.988 |        138.597 |        153.609 |      37 |
| 4          |          5.4 |      149026 |         21.433 |           23.611 |          24.49 |         89.255 |     205 |
| 5          |     14101.77 |    13667311 |      38854.474 |        38854.474 |      38854.474 |      38854.474 |       1 |
| **Median** |        17.83 |     49556.0 |         21.433 |           23.611 |          24.49 |         89.255 |   205.0 |
| **Total**  |     14204.85 | 1.3883615e7 |      38958.161 |        39033.655 |       39031.18 |      39221.316 |  1891.0 |

