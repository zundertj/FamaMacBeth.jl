using Test

using FamaMacBeth

@testset "FamaMacBeth" begin
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
end
