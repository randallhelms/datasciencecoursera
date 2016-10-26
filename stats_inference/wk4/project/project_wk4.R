library(grDevices)
library(ggplot2)

set.seed(1980)
lambda = 0.2
simulations = 1000
n = 40

sd = 1/lambda

#simulate the exponentials

sim_exp <- replicate(simulations,rexp(n,lambda))

#calculate the mean of exponentials

mean_exp <- apply(sim_exp,2,mean)

#plot

colfunc<-colorRampPalette(c("springgreen","royalblue")) #create a gradient color, just because it looks nicer than the block colors
hist(mean_exp,main = "1000 Simulated Exponential Means",xlab="Simulation Means",col=colfunc(10))

#question 1

sample_mean = mean(mean_exp)

hist(mean_exp,main = "1000 Simulated Exponential Means",xlab="Simulation Means",col=colfunc(55),breaks=40)
abline(v=sample_mean,lwd="3",col="green",lty=4)

#question 2

sim_sd <- sd(mean_exp)
sim_var <- sim_sd^2

theory_sd <- (1/lambda)/sqrt(n)
theory_var <- theory_sd^2

print(paste("Theoretical standard deviation: ",theory_sd, "vs. Simulated standard deviation: ",sim_sd))

print(paste("Theoretical variance: ",theory_var, "vs. Simulated variance: ",sim_var))

#question 3

hist(mean_exp,main = "1000 Simulated Exponential Means",xlab="Simulation Means",col=colfunc(55),breaks=40)

x <- seq(min(mean_exp),max(mean_exp),length=100)
y <- dnorm(x, mean = 1/lambda, sd = theory_sd)

lines(x,y*100,col="black",lty=1,lwd=4)