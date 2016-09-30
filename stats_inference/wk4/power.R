#calculating power example

mu0 = 30
mua = 32
sigma = 4
n = 16
alpha = 0.05
z <- qnorm(1-alpha)

mu0test <- pnorm(mu0 + z * sigma/sqrt(n), mean = mu0, sd = sigma/sqrt(n),lower.tail = FALSE)

#result: 0.05

muatest <- pnorm(mu0 + z * sigma/sqrt(n), mean = mua, sd = sigma/sqrt(n),lower.tail = FALSE)

#result: 0.63876

  #huge difference!

#plotting the power curve

library(ggplot2)
library(reshape2)

nseq = c(8, 16, 32, 64, 128) #various n values

mua = seq(30, 35, by = 0.1)

z = qnorm(.95)

power = sapply(nseq, function(n)
  pnorm(mu0 + z * sigma / sqrt(n), mean = mua, sd = sigma / sqrt(n), 
        lower.tail = FALSE)
)

colnames(power) <- paste("n", nseq, sep = "")

d <- data.frame(mua, power)


d2 <- melt(d, id.vars = "mua")

names(d2) <- c("mua", "n", "power")

g <- ggplot(d2, 
            aes(x = mua, y = power, col = n)) + geom_line(size = 2)

g            

#example using manipulate

library(manipulate)

mu0 = 30

  #function elements:
    #sigma: standard deviation
    #mua: mean under alternative
    #n: sample size
    #alpha: type I error rate

  #uses values from previous examples
  #Plot: compares the variance of null and alternate
  #hypotheses
  #line is where to reject the null hypothesis
  #power is probability of getting larger than the black line

myplot <- function(sigma, mua, n, alpha){
  g = ggplot(data.frame(mu = c(27, 36)), aes(x = mu))
  g = g + stat_function(fun=dnorm, geom = "line", 
                        args = list(mean = mu0, sd = sigma / sqrt(n)), 
                        size = 2, col = "red")
  g = g + stat_function(fun=dnorm, geom = "line", 
                        args = list(mean = mua, sd = sigma / sqrt(n)), 
                        size = 2, col = "blue")
  xitc = mu0 + qnorm(1 - alpha) * sigma / sqrt(n)
  g = g + geom_vline(xintercept=xitc, size = 3)
  g
}

  #slider allows you to vary the different parameters

manipulate(
  myplot(sigma, mua, n, alpha),
  sigma = slider(1, 10, step = 1, initial = 4),
  mua = slider(30, 35, step = 1, initial = 32),
  n = slider(1, 50, step = 1, initial = 16),
  alpha = slider(0.01, 0.1, step = 0.01, initial = 0.05)
)

#make an alternative version

manipulate(
  myplot(sigma, mua, n, alpha),
  sigma = slider(2, 12, step = 1, initial = 3),
  mua = slider(30, 35, step = 1, initial = 33),
  n = slider(1, 50, step = 1.5, initial = 20),
  alpha = slider(0.02, 0.1, step = 0.01, initial = 0.08)
  )

#Consider calculating power for a Gossett's T test for our example
#The power is P(((Xbar - mu_0)/(s / sqrt(n)) > t{1-alpha, n-1} ; mu = mu_a)
#Calculating this requires the non-central t 
#distribution.
#power.t.test does this very well
#Omit one of the arguments and it solves for it

test_statistic = ((Xbar - mu_0)/(s / sqrt(n)))
                  
power.t.test(n = 16, delta = 2 / 4, sd=1, type = "one.sample",  alt = "one.sided")$power
power.t.test(n = 16, delta = 2, sd=4, type = "one.sample",  alt = "one.sided")$power
power.t.test(n = 16, delta = 100, sd=200, type = "one.sample", alt = "one.sided")$power

  #power = 0.6040329 (for all three!)

#what this shows is that power is affected by the effect size

#alternate version

power.t.test(n = 16, delta = 50, sd=250, type = "one.sample", alt = "one.sided")$power

  #power = 0.1892608

#example: calculate sample size

power.t.test(power = .8, delta = 2 / 4, sd=1, type = "one.sample",  alt = "one.sided")$n
power.t.test(power = .8, delta = 2, sd=4, type = "one.sample",  alt = "one.sided")$n
power.t.test(power = .8, delta = 100, sd=200, type = "one.sample", alt = "one.sided")$n

  #sample size (n) = 26.13751 (for all three!)

power.t.test(power = .75, delta = 2, sd=4, type = "one.sample",  alt = "one.sided")$n

  #sample size(n) = 22.92961

#power.t.test is a great way to find out the different elements of a power calculation

#try to make power calculations as simple as possible