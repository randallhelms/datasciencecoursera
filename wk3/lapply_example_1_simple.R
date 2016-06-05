#lapply always returns a list

x <- list(a = 1:5, b = rnorm(10))

# x is the object, mean is the function

# lapply applies a function to all elements in the list 

lapply(x,mean)