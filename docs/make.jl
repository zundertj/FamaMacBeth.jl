using Documenter, FamaMacBeth

makedocs(
    format = :html,
    sitename = "FamaMacBeth.jl",
    modules = [FamaMacBeth],
    pages = ["index.md",
            "api.md"
             ]
)

deploydocs(
    repo = "github.com/zundertj/FamaMacBeth.jl.git",
    target = "build",
    julia  = "0.7",
    deps   = nothing,
    make   = nothing
)
