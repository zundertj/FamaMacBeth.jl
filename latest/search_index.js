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
    "location": "api.html#FamaMacBeth.adjr2-Tuple{FamaMacBeth.FMBModel}",
    "page": "API",
    "title": "FamaMacBeth.adjr2",
    "category": "method",
    "text": "adjr2(m::FMBModel) -> Float64\n\nThe adjusted R2.\n\n\n\n\n\n"
},

{
    "location": "api.html#FamaMacBeth.fmb-Tuple{Array,Any,Any}",
    "page": "API",
    "title": "FamaMacBeth.fmb",
    "category": "method",
    "text": "fmb(X, y, g) -> FMBModel()\n\nShort-hand for fit(FMBModel(X,y,g))\n\n\n\n\n\n"
},

{
    "location": "api.html#FamaMacBeth.group-Tuple{FamaMacBeth.FMBResp}",
    "page": "API",
    "title": "FamaMacBeth.group",
    "category": "method",
    "text": "group(m::FMBResp)\ngroup(m::FMBModel)\n\nReturns the group labels used.\n\n\n\n\n\n"
},

{
    "location": "api.html#FamaMacBeth.nobs-Tuple{FamaMacBeth.FMBModel}",
    "page": "API",
    "title": "FamaMacBeth.nobs",
    "category": "method",
    "text": "nobs(m::FMBModel) -> Vector{Int}\n\nReturns the number of observations, per group as identified by g. See also group(m::FMBResp).\n\n\n\n\n\n"
},

{
    "location": "api.html#FamaMacBeth.predict-Tuple{FamaMacBeth.FMBModel,Any}",
    "page": "API",
    "title": "FamaMacBeth.predict",
    "category": "method",
    "text": "predict(m::FMBModel) -> Vector\npredict(m::FMBModel, X) -> Vector\n\nPredicts the outcome using the estimated coefficients and provided independent variables. If independent variables are not provided, uses those from the model.\n\n\n\n\n\n"
},

{
    "location": "api.html#FamaMacBeth.r2-Tuple{FamaMacBeth.FMBModel}",
    "page": "API",
    "title": "FamaMacBeth.r2",
    "category": "method",
    "text": "r2(m::FMBModel) -> Float64\n\nThe un-adjusted R2.\n\n\n\n\n\n"
},

{
    "location": "api.html#FamaMacBeth.residuals-Tuple{FamaMacBeth.FMBModel}",
    "page": "API",
    "title": "FamaMacBeth.residuals",
    "category": "method",
    "text": "residuals(m::FMBModel) -> Vector\n\n\n\n\n\n"
},

{
    "location": "api.html#FamaMacBeth.tstat-Tuple{FamaMacBeth.FMBResp}",
    "page": "API",
    "title": "FamaMacBeth.tstat",
    "category": "method",
    "text": "tstat(m::FMBModel) -> Vector\ntstat(m::FMBModel) -> Vector\n\nThe t-statistic per coefficient whether the coefficient equals zero or not.\n\n\n\n\n\n"
},

{
    "location": "api.html#StatsBase.coef-Tuple{FamaMacBeth.FMBResp}",
    "page": "API",
    "title": "StatsBase.coef",
    "category": "method",
    "text": "coef(m::FMBResp) -> Vector\ncoef(m::FMBModel) -> Vector\n\nThe estimated coefficients.\n\n\n\n\n\n"
},

{
    "location": "api.html#StatsBase.stderror-Tuple{FamaMacBeth.FMBResp}",
    "page": "API",
    "title": "StatsBase.stderror",
    "category": "method",
    "text": "stderror(m::FMBResp) -> Vector\nstderror(m::FMBModel) -> Vector\n\nThe standard error around the estimated coefficients.\n\n\n\n\n\n"
},

{
    "location": "api.html#FamaMacBeth.FMBModel",
    "page": "API",
    "title": "FamaMacBeth.FMBModel",
    "category": "type",
    "text": "FMBModel(X,y,g,resp::FMBResp) <: StatsBase.RegressionModel\n\n\n\n\n\n"
},

{
    "location": "api.html#FamaMacBeth.FMBModel-Tuple{Any,Any,Any}",
    "page": "API",
    "title": "FamaMacBeth.FMBModel",
    "category": "method",
    "text": "FMBModel(X,y,g) -> FMBModel()\n\n\n\n\n\n"
},

{
    "location": "api.html#FamaMacBeth.fit-Tuple{FamaMacBeth.FMBModel}",
    "page": "API",
    "title": "FamaMacBeth.fit",
    "category": "method",
    "text": "fit(m::FMBModel) -> FMBModel()\n\nRuns a Fama-MacBeth (1973) panel regression by first conducting OLS of y on X per group indicated by g, and subsequently computes the mean and standard error using the resulting coefficients. An intercept is not added to X.\n\n\n\n\n\n"
},

{
    "location": "api.html#FamaMacBeth.vcov-Tuple{FamaMacBeth.FMBResp}",
    "page": "API",
    "title": "FamaMacBeth.vcov",
    "category": "method",
    "text": "vcov(m::FMBResp) -> Matrix\nvcov(m::FMBModel) -> Matrix\n\nVariance-covariance matrix of the estimated coefficients.\n\n\n\n\n\n"
},

{
    "location": "api.html#API-1",
    "page": "API",
    "title": "API",
    "category": "section",
    "text": "Modules = [FamaMacBeth]"
},

]}
