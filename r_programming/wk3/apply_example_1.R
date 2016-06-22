# apply applies a function to an aray, where an integer vector specifies which margins should be retained

# you can pass extra arguments should you so choose ...

x <- matrix(rnorm(200), 20,10)

# apply a margin of 2 and the mean function to the x matrix

apply(x, 2, mean)

# apply a margin of 1 and sum to the x matrix

apply(x,1,sum)

# apply margin of 3 and median to the x matrix

apply(x,3,median)

# Oops, doesn't work! Margin has to be 1 or 2

# 1 represents rows, 2 represents columns