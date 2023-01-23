using LinearAlgebra

mutable struct OuterProductMatrix
  u
  v
end

import Base.size
size(A::OuterProductMatrix) = (length(A.u), length(A.v))

import LinearAlgebra.mul!
function mul!(Ax::AbstractVector, A::OuterProductMatrix, x::AbstractVector)
  vx = dot(A.v, x)
  Ax .= vx * A.u
  return Ax
end

import Base.*
function *(A::OuterProductMatrix, x::AbstractVector)
  nrow, ncol = size(A)
  Ax = similar(x, nrow)
  mul!(Ax, A, x)
end