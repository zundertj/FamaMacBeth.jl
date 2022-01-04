using Test

using ReadStat, DataValues # for the Petersen data set

using FamaMacBeth

@testset "general" begin
    y = rand(100,1)
    X = rand(100,3)

    # if all in the same group, we should get OLS coefficients
    g = vec(ones(size(y,1),1))
    @test coef(fmb(X,y,g))==X\y

    g2 = repeat(collect(1:10),inner=10)
    resp = fmb(X,y,g2)
    @test all(nobs(resp).==10)
    @test size(coef(resp),1) == 3
    @test size(coef(resp),2) == 1 # because we take the mean!
    @test group(resp) == collect(1:10)
    @test size(vcov(resp)) == (3, 3)
end

@testset "petersen_dataset" begin
    # download and prcess data
    file = "https://www.kellogg.northwestern.edu/faculty/petersen/htm/papers/se/test_data.dta"
    loc = download(file)
    data = read_dta(loc)
    firmid = Float64.(get.(data.data[1]))
    year = Float64.(get.(data.data[2]))
    x = Float64.(get.(data.data[3]))
    y = Float64.(get.(data.data[4]))

    # fit
    m = fmb([ones(size(x,1),1) x], y, year)

    # compare with https://www.kellogg.northwestern.edu/faculty/petersen/htm/papers/se/test_data.htm
    @test all(round.(coef(m), digits=4) .== [.0313, 1.0356])
    @test all(round.(stderror(m), digits=4) .== [.0234, .0333])
    @test all(round.(tstat(m), digits=2) .== [1.34, 31.06])
    # @test round(adjr2(m),4)==.2078 # this is what Petersen lists, but cannot reproduce
    @test round(adjr2(m);digits=4)==.2076
end
