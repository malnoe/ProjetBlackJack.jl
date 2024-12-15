multiply <- function(x, y) {
  UseMethod("multiply")
}

# Méthode pour les matrices
multiply.matrix <- function(x, y) {
  if (is.matrix(x) && is.matrix(y)) {
    return(x %*% y)  # Multiplication matricielle
  } else if (is.matrix(x) && is.numeric(y)) {
    return(x * y)  # Multiplication élément par élément
  } else {
    stop("Invalid types for matrix multiplication")
  }
}

# Méthode pour les vecteurs
multiply.numeric <- function(x, y) {
  if (is.numeric(x) && is.numeric(y)) {
    return(x * y)  # Multiplication élément par élément
  } else if (is.numeric(x) && is.matrix(y)) {
    return(x * y)  # Multiplication élément par élément
  } else {
    stop("Invalid types for numeric multiplication")
  }
}

# Tests
matrice_A <- matrix(1:4, 2, 2)
matrice_B <- matrix(5:8, 2, 2)
vecteur_1 <- c(1, 2)
vecteur_2 <- c(4, 5)

# Multiplication correcte
print(multiply(matrice_A, matrice_B))      # Multiplication matricielle
print(multiply(vecteur_1, vecteur_2))    # Multiplication élément par élément
print(multiply(matrice_A, vecteur_1))     # Multiplication élément par élément
print(multiply(vecteur_1, matrice_A))     # Multiplication élément par élément

# Mise à jour de la méthode pour les matrices
multiply.matrix <- function(x, y) {
  if (is.matrix(x) && is.matrix(y)) {
    return(x %*% y)  # Multiplication matricielle
  } else if (is.matrix(x) && is.numeric(y) && length(y) == 1) {
    return(x * y)  # Multiplication par un scalaire
  } else if (is.matrix(x) && is.numeric(y)) {
    return(x * y)  # Multiplication élément par élément (vecteur)
  } else {
    stop("Invalid types for matrix multiplication")
  }
}

# Tests supplémentaires
A <- matrix(1:4, 2, 2)
scalar <- 3

print(multiply(A, scalar))  # Multiplication matrice par scalaire