x2 <- 1:4

# use runif to use a random uniform variable function

lapply(x2, runif)

# variation where you specify min and max arguments (default max is 1)

# how this works: you call the x2 variable, pass the runif function, and you specift the min and max parameters

lapply(x2, runif, min = 0, max = 10)