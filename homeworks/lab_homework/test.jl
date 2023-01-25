using LinearAlgebra

function LDL!(A)
    A = Matrix(A) # Cast in matrix to have acces off diag element
    m, n = size(A)
    for i in 1:m
        for j in 1:n
            # Case L_jj
            if i < j
                break
            elseif i == j
                s = 0
                for k in 1:j-1
                    s += A[j, k] * conj(A[j, k])
                end
                A[j, j] = sqrt(A[j, j] - s)
                break
            else
                # Case L_i, j
                s = 0
                for k in 1:j-1
                    s += A[i, k] * conj(A[j, k])
                end
                A[i, j] = (A[i, j] - s) / A[j, j]
            end
        end
    end
    return Symmetric(triu(A))
end

function solve(LD, b)
    # A = LL'
    # Solve for Ly = b
    y = LD \ b
    # back substitution L'x = y
    x = LD' \ y
    return x
end

# A = [1 0 2+2im 0 3-3im; 0 4 0 5 0; 6-6im 0 7 0 8+8im; 0 9 0 1 0; 2+2im 0 3-3im 0 4];
A = Hermitian(rand(ComplexF32, 4, 4));
b = [1, 2, 3, 4]

display(A \ b)

A = LDL!(A)
answer = solve(A, b)

display(answer)
