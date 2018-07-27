module FamaMacBeth

import StatsBase, StatsBase.coef, StatsBase.stderror
using Statistics: mean, std, cov

export fmb, coef, stderror, tstat, nobs, predict, residuals, r2, adjr2, group

# response object
struct FMBResp
    group
    coef::Array
    nobs::Vector{Int}
end

"""
    FMBModel(X,y,g,resp::FMBResp) <: StatsBase.RegressionModel
"""
mutable struct FMBModel <: StatsBase.RegressionModel
    X
    y
    g
    resp::Union{FMBResp, Nothing}

    function FMBModel(X,y,g,resp)
        # checks on input
        @assert size(X,1)==length(y) "y and X must have the same number of observations"
        @assert length(y)==length(g) "g and y must have the same number of observations"
        new(X,y,g,resp)
    end
end

"""
    FMBModel(X,y,g) -> FMBModel()
"""
FMBModel(X,y,g) = FMBModel(X,y,g,nothing)

"""
    group(m::FMBResp)
    group(m::FMBModel)

Returns the group labels used.
"""
group(m::FMBResp) = m.group
group(m::FMBModel) = group(m.resp)

"""
    coef(m::FMBResp) -> Vector
    coef(m::FMBModel) -> Vector

The estimated coefficients.
"""
coef(m::FMBResp) = mean(m.coef, dims=2)
coef(m::FMBModel) = coef(m.resp)

"""
    stderror(m::FMBResp) -> Vector
    stderror(m::FMBModel) -> Vector

The standard error around the estimated coefficients.
"""
stderror(m::FMBResp) = std(m.coef, dims=2)./sqrt(size(m.coef,2))
stderror(m::FMBModel) = stderror(m.resp)

"""
    vcov(m::FMBResp) -> Matrix
    vcov(m::FMBModel) -> Matrix

Variance-covariance matrix of the estimated coefficients.
"""
vcov(m::FMBResp) = cov(m.coef, dims=2)./size(m.coef,2)
vcov(m::FMBModel) = vcov(m.resp)

"""
    tstat(m::FMBModel) -> Vector
    tstat(m::FMBModel) -> Vector

The t-statistic per coefficient whether the coefficient equals zero or not.
"""
tstat(m::FMBResp) = coef(m)./stderror(m)
tstat(m::FMBModel) = tstat(m.resp)

"""
    nobs(m::FMBModel) -> Vector{Int}

Returns the number of observations, per group as identified by `g`. See also `group(m::FMBResp)`.
"""
nobs(m::FMBModel) = m.resp.nobs

"""
    predict(m::FMBModel) -> Vector
    predict(m::FMBModel, X) -> Vector

Predicts the outcome using the estimated coefficients and provided independent variables.
If independent variables are not provided, uses those from the model.
"""
predict(m::FMBModel, X) = X * coef(m)
predict(m::FMBModel) = predict(m, m.X)

"""
    residuals(m::FMBModel) -> Vector
"""
residuals(m::FMBModel) = m.y .- predict(m)

"""
    r2(m::FMBModel) -> Float64

The un-adjusted R2.
"""
function r2(m::FMBModel)
    SSE = sum(residuals(m).^2)
    SST = sum((m.y .- mean(m.y)).^2)
    1-SSE/SST
end

"""
    adjr2(m::FMBModel) -> Float64

The adjusted R2.
"""
function adjr2(m::FMBModel)
    n = length(m.y)
    p = size(m.X,2)
    1.0-(1.0-r2(m))*(n-1)/(n-p)
end

"""
    fmb(X, y, g) -> FMBModel()

Short-hand for fit(FMBModel(X,y,g))
"""
fmb(X::Array, y, g) = fit(FMBModel(X,y,g))

"""
    fit(m::FMBModel) -> FMBModel()

Runs a Fama-MacBeth (1973) panel regression by first conducting OLS of `y` on `X`
per group indicated by `g`, and subsequently computes the mean and standard error
using the resulting coefficients. An intercept is not added to `X`.
"""
function fit(m::FMBModel)
    # pre-allocate output
    ug = unique(m.g)
    coef = zeros(eltype(m.X), size(m.X,2), length(ug))
    nobs = zeros(Int64, length(ug))

    # per group: OLS
    for (i, gs) in enumerate(ug)
        select = m.g.==gs
        coef[:,i] = m.X[select,:]\m.y[select]
        nobs[i] = sum(select)
    end

    m.resp = FMBResp(ug, coef, nobs)
    return m
end

end
