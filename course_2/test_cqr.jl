using Test

include("qr_decomposition.jl")

A = [-1.0 -1.0 1.0
    1.0 3.0 3.0
    -1.0 -1.0 5.0
    1.0 3.0 7.0]

Q = cgs(A)

@test norm(I - Q' * Q) ≤ 1.0e-8