include("outer.jl")

using Test

@testset "test outer product matrix" begin
  for _ = 1 : 10
    for nrow = 2 : 50
      u = rand(nrow)
      for ncol = 2 : 50
        v = rand(ncol)
        A = OuterProductMatrix(u, v)
        uv = u * v'
        x = rand(ncol)
        Ax = A * x
        uvx = uv * x
        @test norm(Ax - uvx) ≤ sqrt(eps(eltype(x))) * norm(uvx)
      end
    end
  end
end