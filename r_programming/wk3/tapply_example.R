# tapply applies function over subsets of a vector

# simulate a vector with 10 normals, 10 uniform, and then 10 normals with a mean of 1

x <- c(rnorm(10), runif(10), rnorm(10,1))

# create a factor variable with 3 levels, each repeated 10 times

f <- gl(3,10)

# take the means of this group with tapply

tapply(x, f, mean)

# take the means without simplification (simplify is TRUE by default)

tapply(x, f, mean, simplify = FALSE)

# calculate the range of observations (min and max)

tapply(x, f, range)
