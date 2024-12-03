module LogToolKit



export Symb, ISymb, HSymb, monomial, polynomial, tensor, tensors, Phi, Phi_inv, fundamental_column



using LaTeXStrings
using Latexify
using Combinatorics



abstract type Symb end



"""
    ISymb(args::Vararg{Int})

Return an Iterated integral symbol with args
"""

struct ISymb <: Symb
    args::Tuple{Vararg{Int}}
    weight::Int
    m::Int
    i::Function
    n::Function
    latex_repr::String

    function ISymb(args::Vararg{Int})
        # Validate the number of arguments
        if length(args) % 2 == 0 || length(args) < 3
            throw(ArgumentError("The number of arguments should be odd and at least 3"))
        end

        m = div(length(args), 2) - 1
        i(r) = r > 0 ? args[1 + 2 * r] : 0
        n(r) = args[2 + 2 * r]
        argstrs = String[]

        # Check the validity of arguments
        if m < 0 || any(n(r) < 1 || i(r) >= i(r + 1) for r in 1:m)
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

Base.:*(a::Symb, b::Symb) = begin
    if a == b
        return monomial((a, 2))
    elseif a < b
        return monomial((a,1), (b,1))
    else
        return monomial((b,1), (a,1))
    end
end

function Phi(I::ISymb, d::Int)
    if d + 1 < I.i(I.m+1)
        throw(ArgumentError("The depth is invalid"))
    end

    if I.m == 0 && I.n(1) == 1
        return 1
    elseif I.i(0) == 0 && I.i(I.m+1) == 0
        return 0
    elseif I.i(0) > 0 && I.i(I.m+1) == 0
        return (-1)^(I.weight) * Phi(ISymb(reverse(I.args)), d)
    elseif I.i(0) > 0 && I.i(I.m+1) > 0
        return sum(
            sum(
                Phi(ISymb(I.args[1:2*k+1]..., p, 0), d) * Phi(ISymb(0, I.n(k)-q, I.args[2*k+3:end]...), d)
                for p in 0:I.n(k)
            )
            for k in 0:I.m
        )
    elseif I.i(0) == 0 && I.i(I.m+1) == d + 1
        return sum(
            (-1)^(I.n(0)+m-1) * product(binomial(I.n(r)+p[r]-1, p[r]) for r in 1:I.m)
            * HSymb(I.i(1), vcat(([I.n(r)+p[r], I.i(r+1)-I.i(r)] for r in 1:I.m)...)...)
            for p in nonnegative_partitions(I.n(0)-1, I.m)
        )
    elseif I.i(0) == 0 && I.i(I.m+1) > 0
        return sum(
            sum(
                (-1)^(I.n(0)+p0+m-1) * HSymb(I.i(I.m+1),1,d+1)^p0 * product(binomial(I.n(r)+p[r]-1, p[r]) for r in 1:I.m)
                * HSymb(I.i(1), vcat(([I.n(r)+p[r], I.i(r+1)-I.i(r)] for r in 1:I.m)...)...)
                for p in nonnegative_partitions(I.n(0)-1-p0, I.m)
            )
            for p0 in 0:I.n(0)-1
        )
    end
end



struct HSymb <: Symb
    args::Tuple{Vararg{Int}}
    weight::Int
    d::Int
    i::Tuple{Vararg{Int}}
    m::Function
    n::Function
    latex_repr::String

    function HSymb(args::Vararg{Int})
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

function partial_differential(H::HSymb, r::Int)
    if r > H.d || r < 1
        throw(ArgumentError("The partial differential is invalid"))
    end
end

function differential(H::HSymb)

end

function Phi_inv(H::HSymb)
    return ISymb(0, 1, vcat(([H.i[r], H.n(r)] for r in 1:H.d)...)..., H.i[end])
end



struct monomial
    vars::Tuple{Vararg{Tuple{Any, Int}}}
    deg::Int
    coef::Number
    latex_repr::String

    function monomial(vars::Vararg{Tuple{Any, Int}}; coef::Number = 1)
        # Validate the arguments
        if any(exponent < 1 for (var, exponent) in vars)
            throw(ArgumentError("The exponents should be at least 1"))
        end

        vars = Tuple(sort(collect(vars)))
        deg = length(vars)>0 ? sum(exponent for (_, exponent) in vars) : 0

        latex_repr = (coef == 1 ? "" : "$(coef)")
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

    function polynomial(terms::Vararg{monomial})
        terms = Tuple(sort(collect(terms)))
        return new(terms, maximum([term.deg for term in terms]), join(map(x->x.latex_repr, terms), '+'))
    end
end



struct tensor
    args::Tuple{Vararg{Any}}
    weight::Int
    coef::Number
    latex_repr::String

    function tensor(args::Vararg{Any}; coef::Number = 1)
        args = Tuple(sort(collect(args)))
        latex_repr = (coef == 1 ? "" : "$(coef)") * join(map(x->x.latex_repr, args), "\\otimes ")

        return new(args, length(args), coef, latex_repr)
    end
end

Base.isless(t1::tensor, t2::tensor) = begin
    if t1.weight != t2.weight
        return t1.weight < t2.weight
    else
        return t1.terms < t2.terms
    end
    return false
end



struct tensors
    terms::Tuple{Vararg{tensor}}
    weight::Int
    latex_repr::String

    function tensors(terms::Vararg{tensor})
        terms = Tuple(sort(collect(terms)))
        return new(terms, maximum([term.weight for term in terms]), join(map(x->x.latex_repr, terms), '+'))
    end
end



function nonnegative_partitions(n::Int, k::Int)
    positive_partitions = union((unique(permutations(unordered_partition)) for unordered_partition in partitions(n + k, k))...)
    return [partition .- 1 for partition in positive_partitions]
end







end