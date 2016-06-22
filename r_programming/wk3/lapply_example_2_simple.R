#lapply always returns a list

x1 <- list(a = 1:4, b = rnorm(10), c = rnorm(20,1), d = rnorm(100,5))

# x is the object, mean is the function

# lapply applies a function to all elements in the list 

lapply(x1,mean)