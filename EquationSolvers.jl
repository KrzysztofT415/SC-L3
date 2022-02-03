#=
 - Author: Krzysztof Tałałaj
=#
module EquationSolvers

function mbisekcji(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64)
    local r, v, u, e, w, c, maxit = x0, f(x1), f(x0), x1 - x0, Inf, Inf, trunc(Int, abs(log2(delta * abs(x0) / abs(x1 - x0)) - 2))

    if sign(u) == sign(v)
        return x1, v, 0, 1
    end

    for it in 1:maxit
        e /= 2
        c = x0 + e
        w = f(c)
        if abs(e) < delta || abs(w) < epsilon
            return c, w, it, 0
        end
        if sign(w) == sign(u)
            x0, u = c, w
        end
    end
    c, w, maxit, 0
end
export mbisekcji

function mstycznych(f, pf, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    local v, x1, v1 = f(x0), Inf, Inf
    if abs(v) < epsilon
        return x0, v, 0, 0
    end

    for it in 1:maxit
        v1 = pf(x0)
        if abs(v1) < epsilon
            return x0, v, 0, 2
        end
        x1 = x0 - v / v1
        v = f(x1)
        if abs(x1 - x0) < delta || abs(v) < epsilon
            return x1, v, it, 0
        end
        x0 = x1
    end

    x1, v, maxit, 1
end
export mstycznych


function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    local f0, f1, s = f(x0), f(x1), Inf

    for it in 1:maxit
        if abs(f0) > abs(f1)
            x0, x1, f0, f1 = x1, x0, f1, f0
        end
        x1, f1, x0 = x0, f0, x0 - f0 * (x1 - x0) / (f1 - f0)
        f0 = f(x0)
        if abs(x1 - x0) < delta || abs(f0) < epsilon
            return x0, f0, it, 0
        end
    end

    x0, f0, maxit, 1
end
export msiecznych


end # end of module