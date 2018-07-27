# FamaMacBeth.jl

[![License](http://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat)](LICENSE)
[![Build Status](https://travis-ci.org/zundertj/FamaMacBeth.jl.svg?branch=master)](https://travis-ci.org/zundertj/FamaMacBeth.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/myo7q4mg8kpn0d2w?svg=true)](https://ci.appveyor.com/project/zundertj/famamacbeth-jl)
[![codecov.io](https://codecov.io/gh/zundertj/FamaMacBeth.jl/branch/master/graphs/badge.svg)](http://codecov.io/github/zundertj/FamaMacBeth.jl?branch=master)
[![Coverage Status](https://coveralls.io/repos/github/zundertj/FamaMacBeth.jl/badge.svg?branch=master)](https://coveralls.io/github/zundertj/FamaMacBeth.jl?branch=master)
[![](https://img.shields.io/badge/docs-latest-blue.svg)](https://zundertj.github.io/FamaMacBeth.jl/latest)

# Installation
This package is work-in-progress, and is therefore not registered. To install (on Julia 0.7)
```
] add "https://github.com/zundertj/FamaMacBeth.jl"
```

# Usage
The main function to use is `fmb()`, which accepts three arguments:
- `y`: outcome
- `X`: matrix with explanatory variables
- `g`: the grouping indicator

```
using FamaMacBeth

y = rand(100,1)
X = rand(100,3)
g = repeat(collect(1:10),inner=10)
response = fmb(X,y,g)
```
You can use the functions `coef`, `stderror` and others to extract the relevant statistics. The interface follows [https://github.com/JuliaStats/StatsBase.jl](https://github.com/JuliaStats/StatsBase.jl) as much as possible. See the [docs](https://zundertj.github.io/FamaMacBeth.jl/latest) for the full API.

# References
- Fama, E. F., & MacBeth, J. D. (1973). Risk, return, and equilibrium: Empirical tests. *Journal of political economy*, 81(3), 607-636.
- Petersen, M. A. (2009). Estimating standard errors in finance panel data sets: Comparing approaches. *The Review of Financial Studies*, 22(1), 435-480.
