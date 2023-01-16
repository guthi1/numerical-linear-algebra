include("outer.jl")

const Rank1Matrix = OuterProductMatrix

"""
A symmetric rank 1 matrix represented as uu'
"""
mutable struct SymmetricRank1Matrix
    u
end

size(A::SymmetricRank1Matrix) = (length(A.u), length(A.u))

function mul!(Ax:AnstractVector, A::SymmetricRank1Matrix, x::AbstractVector)
    ux = dot(A.u, x)
    Ax .= ux * A.u
    return Ax
end

function *(A::SymmetricRank1Matrix, x::AbstractVector)
    opjnrow, ncol = size(A)
    Ax = similar(x, nrow)
    mul!(Ax, A, x)
end

import LinearAlgebra.rank
rank(A::SymmetricRank1Matrix) = norm(A.u) > 0 ? 1 : 0

# Some repetition with outer.jl, we could do better
