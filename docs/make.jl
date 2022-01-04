using Documenter, FamaMacBeth

makedocs(
    sitename = "FamaMacBeth.jl",
    modules = [FamaMacBeth],
    pages = ["index.md",
        "api.md"]
)

deploydocs(
    repo = "github.com/zundertj/FamaMacBeth.jl.git",
    target = "build",
    deps = nothing,
    make = nothing
)
