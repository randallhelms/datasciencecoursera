#generating random numbers from a linear model

set.seed(20)

#set x variable

x <- rnorm(100)

# set epsilon variable

e <- rnorm(100,0,2)

# create formula

y <- 0.5 + 2 * x + e

summary(y)

plot(x,y)