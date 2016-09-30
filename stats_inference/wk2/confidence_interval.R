#wald interval

#calculate 2 sd confidence interval with .6 as p' and 100 as n

.6 + c(-1,1)*qnorm(.975)*sqrt(.6*.4/100)

#use binom.test for same purpose

binom.test(60,100)$conf.int

#wald interval with small sample

n = 20

.2 + c(-1,1)*qnorm(.975)*sqrt(.2*.8/20)

.2 + c(-1,1)*qnorm(.975)*sqrt(.2*.8/1000)

