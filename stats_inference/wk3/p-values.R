#example: suppose that you have t-statistic of 2.5
#with 15 degrees of freedom (df)
#H0: mu = mu0 versus Ha: mu > mu0

pt(2.5,15,lower.tail = FALSE)

#result = 0.0122529
  #either null hypothesis is true and there is very
  #large t-statistic, or it is false

#**Further example*

#If you have 8 children, 7 are girls, none are 
#twins

#What's the probability of 7 girls, if each child 
#has 50% chance of being a girl?

#H0: p = 0.5 vs Ha: p > 0.5

choose(8,7) * 0.5^8 + choose(8,8) * 0.5^8

pbinom(6,size = 8, prob = 0.5, lower.tail = FALSE)

#whoa mama, the result is the same!

#Poisson example

#hospital has infection rate of 10 infections 
#per 100 person/days at risk (rate of 0.1) 
#during the last monitoring period.

#infection rate of 0.05 is an important benchmark.

#could the observed rate being larger than 0.05 
#be attributed to chance?

#H_0: lambda = 0.05$ so that lambda_0 100 = 5
  #Consider $_a: lambda > 0.05

ppois(9, 5, lower.tail = FALSE)

#result is 0.03182806
#low probability = 3% chance
#should implement quality control