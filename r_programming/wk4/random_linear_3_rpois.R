#simulating poisson model

set.seed(1)

#predictor variable

x2 <- rnorm(100)

#make linear predictor log

log.mu <- 0.5 + 0.3 * x2

#use rpois to simulate random distribution
#to get linear predictor mean

y2 <- rpois(100,exp(log.mu))

plot(x2,y2)