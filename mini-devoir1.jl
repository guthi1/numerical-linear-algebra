# """
# Realized by Guillaume Thibault - 1948612
# Will be tested with: include("mini-devoir1.jl")
# """
using LinearAlgebra, Test

# 1: Linear system Ax = b with A: 100x100 and B: 100x1
dim = 100
A = rand(dim, dim)
b = ones(100, 1)
x = A \ b

# 2, residu, error Ar and condition number for A
r = A * x - b
Ar = norm(A * r)
condA = cond(A)

# 3 Check result
@test size(A) == (100, 100)
@test norm(r) / norm(x) <= condA * norm(A * r) / norm(b)
