#q2

#Suppose that diastolic blood pressures (DBPs) for 
#men aged 35-44 are normally distributed with a mean 
#of 80 (mm Hg) and a standard deviation of 10. About 
#what is the probability that a random 35-44 year old 
#has a DBP less than 70?

pnorm(70, mean = 80,sd = 10)

#q3

#Brain volume for adult women is normally distributed 
#with a mean of about 1,100 cc for women with a 
#standard deviation of 75 cc. What brain volume 
#represents the 95th percentile?

qnorm(.95,mean=1100,sd=75)

#q4

#Refer to the previous question. Brain volume for 
#adult women is about 1,100 cc for women with a 
#standard deviation of 75 cc. Consider the sample 
#mean of 100 random adult women from this population.
#What is the 95th percentile of the distribution of 
#that sample mean? 

qnorm(.95,mean=1100,sd=75/sqrt(100))

#q5

#You flip a fair coin 5 times, about what's the 
#probability of getting 4 or 5 heads?

dbinom(4,size=5,prob = 0.5) +
dbinom(5,size=5,prob = 0.5)

#q6

#The respiratory disturbance index (RDI), a 
#measure of sleep disturbance, for a specific 
#population has a mean of 15 (sleep events per 
#hour) and a standard deviation of 10. They are 
#not normally distributed. Give your best estimate 
#of the probability that a sample mean RDI of 100 
#people is between 14 and 16 events per hour?

sample_mean = 10/sqrt(100) #10 is sd, n is 100

#if SD is 1, then .68 is the probability

#q8

#The number of people showing up at a bus stop is 
#assumed to be Poisson with a mean of 5 people per 
#hour. You watch the bus stop for 3 hours. About 
#what's the probability of viewing 10 or fewer 
#people?

ppois(10,lambda = 5*3)