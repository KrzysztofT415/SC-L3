#!/usr/bin/julia
#=
 - Author: Krzysztof Tałałaj
=#

include("EquationSolvers.jl")
using .EquationSolvers

f1 = x -> ℯ^(1 - x)-1
pf1 = x -> -ℯ^(1 - x)
f2 = x -> x*ℯ^(-x)
pf2 = x -> -(x-1)*ℯ^(-x)
δ = ϵ = 1e-5
σ = 100

println("EX6:")
println("F1 Bisekcji: ",mbisekcji(f1, π/4, π/2, δ, ϵ))
println("F1 Newtona: ",mstycznych(f1, pf1, π/4, δ, ϵ, σ))
println("F1 Siecznych: ",msiecznych(f1, π/4, π/2, δ, ϵ, σ))

println("\nF2 Bisekcji: ",mbisekcji(f2, -ℯ/3, π/4, δ, ϵ))
println("F2 Newtona: ",mstycznych(f2, pf2, -π/4, δ, ϵ, σ))
println("F2 Siecznych: ",msiecznych(f2, -π/3, π/4, δ, ϵ, σ))

println("\nF1 Newtona x0 > 1 (101): ",mstycznych(f1, pf1, 101.0, δ, ϵ, σ))
println("F2 Newtona x0 > 1 (100): ",mstycznych(f2, pf2, 100.0, δ, ϵ, σ))
println("F2 Newtona x0 = 1: ",mstycznych(f2, pf2, 1.0, δ, ϵ, σ))