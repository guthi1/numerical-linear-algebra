using LinearAlgebra


function cgs(A)
    # Copy the Matrix
    Q = copy(A)
    # Compute the thin QR decomposition
    m_row, n_col = size(Q)
    for i in 1:n_col
        q_i = @view Q[:, i]
        for j in 1:i-1
            q_j = @view Q[:, j]
            # q: orthogonal
            q_i .-= dot(q_i, q_j) * q_j
        end
        # q: orthonormal
        q_i ./= norm(q_i)
        println(i)
    end
    return Q
end


A = rand(2, 2)
println(A)
println("Q:")
Q = cgs(A)
display(Q)
@test norm(I - Q' * Q) ≤ 1.0e-8

function cgs_qr(A)
    # Copy the Matrix
    Q = copy(A)
    # Compute the thin QR decomposition
    m_row, n_col = size(Q)
    for i in 1:n_col
        q_i = @view Q[:, i]
        for j in 1:i-1
            q_j = @view Q[:, j]
            # q: orthogonal
            q_i .-= dot(q_i, q_j) * q_j
        end
        # q: orthonormal
        q_i ./= norm(q_i)
        println(i)
    end
    return Q
end
