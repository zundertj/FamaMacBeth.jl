# FamaMacBeth.jl

[![License](http://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat)](LICENSE)
[![Build Status](https://travis-ci.org/zundertj/FamaMacBeth.jl.svg?branch=master)](https://travis-ci.org/zundertj/FamaMacBeth.jl)
[![codecov.io](https://codecov.io/gh/zundertj/FamaMacBeth.jl/branch/master/graphs/badge.svg)](http://codecov.io/github/zundertj/FamaMacBeth.jl?branch=master)

# Installation
This package is work-in-progress, and is therefore not registered. To install (on Julia 0.7)
```
] clone https://github.com/zundertj/FamaMacBeth.jl
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
You can use the functions `coef`, `stderror` and others to extract the relevant statistics.