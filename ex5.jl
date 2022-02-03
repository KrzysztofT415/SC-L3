#!/usr/bin/julia
#=
 - Author: Krzysztof Tałałaj
=#

include("EquationSolvers.jl")
using .EquationSolvers

f = x -> 3x
g = x -> ℯ^x
h = x -> f(x) - g(x)

δ = ϵ = 1e-4

println("EX5:")
println(mbisekcji(h, 1.5, 2.0, δ, ϵ))
println(mbisekcji(h, 0.5, 1.0, δ, ϵ))