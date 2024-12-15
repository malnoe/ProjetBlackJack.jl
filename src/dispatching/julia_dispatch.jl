# Méthode pour deux matrices
function multiply(x::Matrix, y::Matrix)
    return x * y  # Multiplication matricielle
end

# Méthode pour deux vecteurs
function multiply(x::Vector, y::Vector)
    return x .* y  # Multiplication élément par élément
end

# Méthode pour une matrice et un vecteur
function multiply(x::Matrix, y::Vector)
    return x .* y  # Multiplication élément par élément
end

# Méthode pour un vecteur et une matrice
function multiply(x::Vector, y::Matrix)
    return x .* y  # Multiplication élément par élément
end

# # Tests
# A = [1 2; 3 4]
# B = [5 6; 7 8]
# v1 = [1, 2]
# v2 = [4, 5]

# println(multiply(A, B))   # Multiplication matricielle
# println(multiply(v1, v2)) # Multiplication élément par élément
# println(multiply(A, v1))  # Multiplication élément par élément
# println(multiply(v1, A))  # Multiplication élément par élément

# Ajout d'une méthode spécifique pour matrice et nombre
function multiply(x::Matrix, y::Number)
    return x .* y  # Multiplication par un scalaire
end

# Tests supplémentaires
A = [1 2; 3 4]
scalar = 3

println(multiply(A, scalar))  # Multiplication matrice par scalaire
