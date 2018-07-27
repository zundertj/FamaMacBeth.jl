var documenterSearchIndex = {"docs": [

{
    "location": "index.html#",
    "page": "Tutorial",
    "title": "Tutorial",
    "category": "page",
    "text": ""
},

{
    "location": "index.html#Tutorial-1",
    "page": "Tutorial",
    "title": "Tutorial",
    "category": "section",
    "text": "TODO"
},

{
    "location": "api.html#",
    "page": "API",
    "title": "API",
    "category": "page",
    "text": ""
},

{
    "location": "api.html#FamaMacBeth.fmb-Tuple{Array,Any,Any}",
    "page": "API",
    "title": "FamaMacBeth.fmb",
    "category": "method",
    "text": "fmb(X, y, g) -> FMBResp()\n\nRuns a Fama-MacBeth (1973) panel regression by first conducting OLS of y on X per group indicated by g, and subsequently computes the mean and standard error using the resulting coefficients. An intercept is not added to X.\n\n\n\n\n\n"
},

{
    "location": "api.html#FamaMacBeth.nobs-Tuple{FamaMacBeth.FMBResp}",
    "page": "API",
    "title": "FamaMacBeth.nobs",
    "category": "method",
    "text": "nobs(m::FMBResp) -> Vector{Int}\n\nReturns the number of observations, per group as identified by g. See also group(m::FMBResp).\n\n\n\n\n\n"
},

{
    "location": "api.html#FamaMacBeth.tstat-Tuple{FamaMacBeth.FMBResp}",
    "page": "API",
    "title": "FamaMacBeth.tstat",
    "category": "method",
    "text": "tstat(m::FMBResp) -> Vector{}\n\nThe t-statistic per coefficient whether the coefficient equals zero or not.\n\n\n\n\n\n"
},

{
    "location": "api.html#StatsBase.coef-Tuple{FamaMacBeth.FMBResp}",
    "page": "API",
    "title": "StatsBase.coef",
    "category": "method",
    "text": "coef(m::FMBResp) -> Vector{}\n\nThe estimated coefficients.\n\n\n\n\n\n"
},

{
    "location": "api.html#StatsBase.stderror-Tuple{FamaMacBeth.FMBResp}",
    "page": "API",
    "title": "StatsBase.stderror",
    "category": "method",
    "text": "stderror(m::FMBResp) -> Vector{}\n\nThe standard error around the coefficients.\n\n\n\n\n\n"
},

{
    "location": "api.html#FamaMacBeth.group-Tuple{FamaMacBeth.FMBResp}",
    "page": "API",
    "title": "FamaMacBeth.group",
    "category": "method",
    "text": "group(m::FMBResp)\n\nReturns the group labels used.\n\n\n\n\n\n"
},

{
    "location": "api.html#API-1",
    "page": "API",
    "title": "API",
    "category": "section",
    "text": "Modules = [FamaMacBeth]"
},

]}
