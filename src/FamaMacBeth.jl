module FamaMacBeth

import StatsBase.coef, StatsBase.stderror, Statistics.mean

export fmb, coef, stderror, tstat, nobs

struct FMBResp
    group
    coef::Array
    nobs::Vector{Int}
end

"""
    group(m::FMBResp)

Returns the group labels used.
"""
group(m::FMBResp) = m.group

"""
    coef(m::FMBResp) -> Vector{}

The estimated coefficients.
"""
coef(m::FMBResp) = mean(m.coef, dims=2)

"""
    stderror(m::FMBResp) -> Vector{}

The standard error around the coefficients.
"""
stderror(m::FMBResp) = stderror(m.coef, dims=2)./sqrt(size(m.coef,2))

"""
    tstat(m::FMBResp) -> Vector{}

The t-statistic per coefficient whether the coefficient equals zero or not.
"""
tstat(m::FMBResp) = coef(m)./stderror(m)

"""
    nobs(m::FMBResp) -> Vector{Int}

Returns the number of observations, per group as identified by `g`. See also `group(m::FMBResp)`.
"""
nobs(m::FMBResp) = m.nobs

"""
    fmb(X, y, g) -> FMBResp()

Runs a Fama-MacBeth (1973) panel regression by first conducting OLS of `y` on `X`
per group indicated by `g`, and subsequently computes the mean and standard error
using the resulting coefficients. An intercept is not added to `X`.
"""
function fmb(X::Array, y, g)
    # checks on input
    @assert size(X,1)==length(y) "y and X must have the same number of observations"
    @assert length(y)==length(g) "g and y must have the same number of observations"

    # pre-allocate output
    ug = unique(g)
    coef = zeros(eltype(X), size(X,2), length(ug))
    nobs = zeros(Int64, length(ug))

    # per group: OLS
    for (i, gs) in enumerate(ug)
        select = g.==gs
        coef[:,i] = X[select,:]\y[select]
        nobs[i] = sum(select)
    end

    return FMBResp(ug, coef, nobs)
end

end
