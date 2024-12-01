module LogToolKit

using Latexify
using LaTeXStrings

abstract type Symb end

struct ISymb <: Symb
    args::Tuple{Vararg{Int}}
    weight::Int
    m::Int
    i::Function
    n::Function
    latex_repr::String

    function ISymb(args::Tuple{Vararg{Int}})
        # Validate the number of arguments
        if length(args) % 2 == 0 || length(args) < 3
            throw(ArgumentError("The number of arguments should be odd and at least 3"))
        end

        m = div(length(args), 2) - 1
        i(r) = r > 0 ? args[1 + 2 * r] : 0
        n(r) = args[2 + 2 * r]
        argstrs = String[]

        # Check the validity of arguments
        if m <= 0 || any(n(r) < 1 || i(r) >= i(r + 1) for r in 1:m)
            throw(ArgumentError("The arguments are not valid"))
        end
        
        # Form the latex string
        for r in 0:m
            push!(argstrs, "a_{$(i(r))}")
            if n(r) == 2
                push!(argstrs, "0")
            elseif n(r) > 2
                push!(argstrs, "0^{$(n(r)-1)}")
            end
        end
        push!(argstrs, "a_{$(i(m+1))}")

        # Return the final object
        return new(args, sum(n(r) for r in 0:m) - 1, m, i, n, "I($(join(argstrs, ',')))")
    end
end

Base.isless(a::ISymb, b::ISymb) = begin
    if a.weight != b.weight
        return a.weight < b.weight
    end

    for r in 0: a.m-1
        if a.i(a.m-r) != b.i(b.m-r)
            return a.i(a.m-r) < b.i(b.m-r)
        elseif a.n(a.m-r) != b.n(b.m-r)
            return a.n(a.m-r) > b.n(b.m-r)
        end
    end

    return a.i(0) < b.i(0)
end



struct HSymb <: Symb
    args::Tuple{Vararg{Int}}
    weight::Int
    d::Int
    i::Tuple{Vararg{Int}}
    m::Function
    n::Function
    latex_repr::String

    function HSymb(args::Tuple{Vararg{Int}})
        # Validate the number of arguments
        if length(args) % 2 == 0 || length(args) < 3
            throw(ArgumentError("The number of arguments should be odd and at least 3"))
        end

        d = div(length(args), 2)
        i = cumsum(args[1:2:end])
        m(r) = args[2 * r - 1]
        n(r) = args[2 * r]
        weight = n(1)==0 ? 1 : sum(n(r) for r in 1:d)
        argstrs = String[]
        indices = Int64[]

        # Check the validity of arguments
        if d <= 0 || any(m(r) < 1 for r in 1:d+1) || n(1)<0 || (d > 1 && any(n(r) < 1 for r in 1:d))
            throw(ArgumentError("The arguments are not valid"))
        end

        # Form the latex string
        for r in 1:d
            push!(argstrs, "x_{$(i[r])\\to $(i[r+1])}")
            push!(indices, n(r))
        end

        # Return the final object
        return new(args, weight, d, i, m, n, "[$(join(argstrs, ','))]_{$(join(indices, ','))}")
    end
end

Base.isless(a::HSymb, b::HSymb) = begin
    if a.weight != b.weight
        return a.weight < b.weight
    elseif a.i[end] != b.i[end]
        return a.i[end] < b.i[end]
    end

    for r in 0: a.d-1
        if a.m(a.d-r) != b.m(b.d-r)
            return a.m(a.d-r) > b.m(b.d-r)
        elseif a.n(a.d-r) != b.n(b.d-r)
            return a.n(a.d-r) > b.n(b.d-r)
        end
    end

    return false
end



struct monomial
    vars::Tuple{Vararg{Tuple{Symb, Int}}}
    deg::Int
    coef::Number
    latex_repr::String

    function monomial(coef::Number, vars::Tuple{Vararg{Tuple{Symb, Int}}} = ())
        # Validate the arguments
        if any(exponent < 1 for (var, exponent) in vars)
            throw(ArgumentError("The exponents should be at least 1"))
        end

        vars = Tuple(sort(collect(vars), by = x -> x[1]))

        deg = length(vars)>0 ? sum(exponent for (_, exponent) in vars) : 0

        latex_repr = "$(coef)"

        for (var, exponent) in vars
            if exponent == 1
                latex_repr *= "$(var.latex_repr)"
            elseif exponent > 1
                latex_repr *= "$(var.latex_repr)^{$(exponent)}"
            end
        end

        return new(vars, deg, coef, latex_repr)
    end
end

Base.isless(m1::monomial, m2::monomial) = begin
    if m1.deg != m2.deg
        return m1.deg < m2.deg
    end

    for ((var1, exp1), (var2, exp2)) in zip(m1.vars, m2.vars)
        if var1 != var2
            return var1 < var2
        elseif exp1 != exp2
            return exp1 < exp2
        end
    end
    
    return false
end



struct polynomial
    terms::Tuple{Vararg{monomial}}
    deg::Int
    latex_repr::String

    function polynomial(terms::Tuple{Vararg{monomial}})
        terms = Tuple(sort(collect(terms)))
        return new(terms, maximum([term.deg for term in terms]), join(map(x->x.latex_repr, terms), '+'))
    end
end



