#!/usr/bin/julia
#=
 - Author: Krzysztof Tałałaj
=#

include("EquationSolvers.jl")
using .EquationSolvers

f = x -> sin(x) - (0.5*x)^2
pf = x -> cos(x) - 0.5*x
δ = ϵ = 0.5e-5
σ = 100

println("EX4:")
println("Bisekcji: ",mbisekcji(f, 1.5, 2.0, δ, ϵ))
println("Newtona: ",mstycznych(f, pf, 1.5, δ, ϵ, σ))
println("Siecznych: ",msiecznych(f, 1.5, 2.0, δ, ϵ, σ))