# sapply simplifies lapply (if possible)

# sapply will return vector for list with elements of length 1

# sapply will return matrix for vectors with length >1

# let's use an earlier example to illustrate this:

x1 <- list(a = 1:4, b = rnorm(10), c = rnorm(20,1), d = rnorm(100,5))

# sapply will give a simplified vector with four means

sapply(x1,mean)