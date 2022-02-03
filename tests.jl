#!/usr/bin/julia
#=
 - Author: Krzysztof Tałałaj
=#

include("EquationSolvers.jl")
using .EquationSolvers
using Test

δ = ϵ = 0.5e-5
σ = 100
tests = [["x-tan(x)", x -> x-tan(x), x -> 1-sec(x)^2, 4.493409458, 4.3, 4.6],
    ["x*sin(x)", x -> x*sin(x), x -> sin(x)+x*cos(x), π, 3.0, 3.5],
    ["x^2-ℯ^x", x -> x^2-ℯ^x, x -> 2x-ℯ^x, -0.703467422, -1.0, 0.0],
    ["ℯ^-x+tan(x)", x -> ℯ^-x+tan(x), x -> sec(x)^2-ℯ^-x, 3.096412305, 2.5, 3.5],
    ["ℯ^(x*cos(x))-2", x -> ℯ^(x*cos(x))-2, x -> ℯ^(x*cos(x))*(cos(x)-x*sin(x)), 4.855629558, 4.5, 5.0]]

@testset "Testing EquationSolvers" begin
    @testset "Bisection method" begin
        for (txt, f, pf, expected, a, b) in tests
            @testset "$txt" begin
                r, v, it, err = mbisekcji(f, a, b, δ, ϵ)
                @test err == 0
                @test abs(r - expected) < ϵ
            end
        end
    end
    @testset "Tangents method" begin
        for (txt, f, pf, expected, a, b) in tests
            @testset "$txt" begin
                r, v, it, err = mstycznych(f, pf, a, δ, ϵ, σ)
                @test err == 0
                @test abs(r - expected) < ϵ
            end
        end
    end
    @testset "Secant method" begin
        for (txt, f, pf, expected, a, b) in tests
            @testset "$txt" begin
                r, v, it, err = msiecznych(f, a, b, δ, ϵ, σ)
                @test err == 0
                @test abs(r - expected) < ϵ
            end
        end
    end
end
