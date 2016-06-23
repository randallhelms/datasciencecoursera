# create an array with 2 rows, 2 columns, and a third dimension of 10

a <- array(rnorm(2 * 2 * 10), c(2,2,10))

# calculate the means of each row

# collapse the third dimension (done by using c(1,2) and not specifying 3)

apply(a, c(1,2), mean)

# quicker way to do it

rowMeans(a, dims = 2)