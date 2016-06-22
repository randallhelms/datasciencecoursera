#generating random numbers from a linear model

set.seed(10)

#set x variable as binomial

x1 <- rbinom(100,1,0.5)

#set epsilon

e1 <- rnorm(100,0,2)

#make formula

y1 <- 0.5 + 2 * x1 + e1

summary(y1)

plot(x1,y1)