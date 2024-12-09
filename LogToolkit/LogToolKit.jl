module LogToolKit



export Symb, ISymb, HSymb, monomial, lincomb, polynomial, tensor, Phi, Phi_inv, fundamental_column



using LaTeXStrings
using Latexify
using Combinatorics



function ordered_partitions(n::Int, k::Int; positive=true)
    if positive
        return union((unique(permutations(unordered_partition)) for unordered_partition in partitions(n + k, k))...)
    else
        return [partition .- 1 for partition in ordered_partitions(n, k)]
    end
end



abstract type Symb end



struct monomial{T}
    # T must be comparable type that has the latex_repr attribute
    vars::Tuple{Vararg{Union{Pair{T, Int}}}}
    deg::Int
    latex_repr::String

    # constructor for monomial{T}, Int refers to the exponent
    function monomial{T}(vars::Vararg{Union{Tuple{T, Int}, Pair{T, Int}, T}}) where T
        if length(vars) < 1
            throw(ArgumentError("vars cannot be empty"))
        end
        # multiply the variables
        counter = Dict{T, Int}()
        for var in vars
            (key, value) = typeof(var) <: T ? (var, 1) : var
            if value <= 0
                throw(ArgumentError("the exponent must be at least 1"))
            end
            counter[key] = get(counter, key, 0) + value
        end

        # sort the variables
        vars = Tuple(sort(collect(counter)))

        # compute the degree of the monomial
        deg = sum([exponent for (_, exponent) in vars])

        # generate latex_repr
        latex_repr = ""
        for (var, exponent) in vars
            if exponent == 1
                latex_repr *= "$(var.latex_repr)"
            else
                latex_repr *= "$(var.latex_repr)^{$(exponent)}"
            end
        end

        return new{T}(vars, deg, latex_repr)
    end
end

struct tensor{T}
    # T must be a type that has the latex_repr attribute
    args::Tuple{Vararg{T}}
    latex_repr::String

    # constructor for tensor{T}
    function tensor{T}(args::Vararg{T}) where T
        if length(args) < 2
            throw(ArgumentError("the number of vars must be at least 2"))
        end
        return new{T}(args, join(map(x -> x.latex_repr, args), "\\otimes "))
    end
end

struct lincomb{T}
    # T must be comparable type that has the latex_repr attribute
    terms::Tuple{Vararg{Union{T, Pair{T, Number}}}}
    intercept::Number
    latex_repr::String

    # constructor for lincomb, Number refers to the coefficient
    # Number is in the second argument to ease the sorting of variables
    function lincomb{T}(terms::Vararg{Union{T, Tuple{T, Number}, Pair{T, Int}}}; intercept=0) where T
        if length(terms) < 1
            throw(ArgumentError("the linear combination cannot be empty"))
        end
        # add the variables
        counter = Dict{T, Number}()
        for term in terms
            (key, value) = typeof(term) <: T ? (term, 1) : term
            counter[key] = get(counter, key, 0) + value
        end

        # sort the variables
        terms = Tuple(sort(collect(counter)))

        # generate latex_repr
        argstr = String[]
        if intercept != 0
            push!(argstr, "($intercept)")
        end
        for term in terms
            if term.second == 0
                continue
            elseif term.second == 1
                push!(argstr, term.first.latex_repr)
            else
                push!(argstr, "($(term.second))" * term.first.latex_repr)
            end
        end
        latex_repr = join(argstr, '+')

        return new{T}(terms, intercept, latex_repr)
    end
end
polynomial{T} = lincomb{Union{T, monomial{T}}}

## Overloading the Base operators ==, <, *, +

Base.isequal(a::Number, b::Union{Symb, monomial{Symb}, tensor{Symb}}) = false
Base.isequal(a::Symb, b::monomial{Symb}) = b.deg == 1 && a == b.vars[1].first
Base.isequal(a::Number, b::polynomial{Symb}) = length(b.terms) == 0 && a == b.intercept
Base.isequal(a::Union{Symb, monomial{Symb}}, b::polynomial{Symb}) = b.intercept == 0 && length(b.terms) == 1 && a == b.terms[1].first && b.terms[1].second == 1


Base.isless(a::Number, b::Union{Symb, monomial{Symb}, tensor{Symb}}) = true
Base.isless(a::T, b::monomial{T}) where T = b.deg > 1 ? true : a < b.vars[1].first
Base.isless(a::monomial{T}, b::T) where T = b < a
Base.isless(m1::monomial{T}, m2::monomial{T}) where T = m1.deg != m2.deg ? m1.deg < m2.deg : m1.vars < m2.vars
Base.isless(t1::tensor{T}, t2::tensor{T}) where T = length(t1) != length(t2) ? length(t1) < length(t2) : t1.terms < t2.terms


Base.:+(a::Number, b::Union{Symb, monomial{Symb}}) = a == 0 ? b : polynomial{Symb}(b; intercept=a)
Base.:+(a::Union{Symb, monomial{Symb}}, b::Number) = b + a
Base.:+(a::Number, b::polynomial{Symb}) = polynomial{Symb}(b.terms; intercept=a+b.intercept)
Base.:+(a::polynomial{Symb}, b::Number) = b + a
Base.:+(a::Union{Symb, monomial{Symb}}, b::Union{Symb, monomial{Symb}}) = polynomial{Symb}(a, b)
Base.:+(a::Union{Symb, monomial{Symb}}, b::polynomial{Symb}) = polynomial{Symb}(a, b.terms...; intercept=b.intercept)
Base.:+(a::polynomial{Symb}, b::Union{Symb, monomial{Symb}}) = b + a
Base.:+(a::polynomial{Symb}, b::polynomial{Symb}) = polynomial{Symb}(a.terms, b.terms...; intercept=a.intercept+b.intercept)


Base.:*(a::Number, b::Union{Symb, monomial{Symb}}) = a == 0 ? 0 : polynomial{Symb}((b, a))
Base.:*(a::Union{Symb, monomial{Symb}}, b::Number) = b * a
Base.:*(a::Number, b::polynomial{Symb}) = a == 0 ? 0 : polynomial{Symb}(map(x->(x.first, a*x.second), b.terms)...; intercept=a*b.intercept)
Base.:*(a::polynomial{Symb}, b::Number) = b * a
Base.:*(a::Symb, b::Symb) = monomial{Symb}(a, b)
Base.:*(a::Symb, b::monomial{Symb}) = monomial{Symb}(a, b.vars...)
Base.:*(a::monomial{Symb}, b::Symb) = b * a
Base.:*(a::monomial{Symb}, b::monomial{Symb}) = monomial{Symb}(a.vars..., b.vars...)
Base.:*(a::Union{Symb, monomial{Symb}}, b::polynomial{Symb}) = polynomial{Symb}((a, b.intercept), map(x->(a*x.first, x.second), b.terms)...)
Base.:*(a::polynomial{Symb}, b::Union{Symb, monomial{Symb}}) = b * a
Base.:*(a::polynomial{Symb}, b::polynomial{Symb}) = polynomial{Symb}(
    vec([(t1.first * t2.first, t1.second * t2.second) for t1 in a.terms, t2 in b.terms])...,
    [(t.first, a.intercept * t.second) for t in b.terms]...,
    [(t.first, b.intercept * t.second) for t in a.terms]...
    ; intercept = a.intercept * b.intercept
)







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
    return (-1)^H.d * ISymb(0, 1, vcat(([H.i[r], H.n(r)] for r in 1:H.d)...)..., H.i[end])
end



function fundamental_column(h::HSymb)
    visited = Set{HSymb}()
    result = []

    function dfs(H::HSymb)
        if H in visited
            return
        end

        push!(result, Phi_inv(H))
        push!(visited, H)

        if H.d == 1 && H.n(1) == 1
            return
        end

        for r in 1:H.d
            if H.n(r) > 1
                dfs(HSymb(H.args[1:2*r-1]..., H.n(r)-1, H.args[2*r+1:end]...))
            elseif r == H.d
                dfs(HSymb(H.args[1:end-3]..., H.m(H.d)+H.m(H.d+1)))
            else
                dfs(HSymb(H.args[1:2*r-2]..., H.m(r)+H.m(r+1), H.args[2*r+2:end]...))
                dfs(HSymb(H.args[1:2*r-1]..., H.n(r+1), H.m(r+1)+H.m(r+2), H.args[2*r+4:end]...))
            end
        end
    end

    dfs(h)
    return [1, sort(result)...]
end



end