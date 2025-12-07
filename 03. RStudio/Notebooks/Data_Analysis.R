# Basics of R Programming
# 1. Objects : Vector
# Vector is a 1d homogeneous
name <- c("kanak","kanika","karan")
name
class(name)
vec <- 1:20
vec
# Matrix is 2d homogeneous
mat <- matrix(1:20, nrow = 4, ncol = 5)
mat
# to check the dimensions
dim(mat)
class(mat)
# the print statement in R takes in only 1 element
paste("The Dimension is :", dim(mat)) # concatenation
mat <- matrix(1:20, nrow = 4, ncol = 5, byrow = F)
mat
mat <- matrix(1:20, nrow = 4, ncol = 5, byrow = TRUE)
mat
# arrays : 1 to n dimensional
arr_3d <- array(1:27, c(3,3,3))
arr_3d
# data frames : 2 dimensional data where each column is a vector
name   <- c("Alice", "Bob", "Charlie", "Diana")
age    <- c(25, 30, 22, 28)       
sex    <- c("F", "M", "M", "F")
height <- c(165, 175, 180, 160)   
weight <- c(55, 70, 80, 50) 
df <- data.frame(name, age, sex, height, weight)
df
