# make a 20x10 matrix with random variables

x1 <- matrix(rnorm(200), 20, 10)

# calculate the 25th and 75th percentile of each row

apply(x1, 1, quantile, probs = c(0.25, 0.75))

# broken down: 

# x1 is the array
# 1 is the margin, i.e. row
# quantile is the function
# probs is the optional argument, in this case set to only show the 25th & 75th percentiles
# no default arguments for quantile