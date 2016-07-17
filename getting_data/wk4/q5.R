#use quantmod to get historical stock prices

library(quantmod)

amzn = getSymbols("AMZN",auto.assign=FALSE)

sampleTimes = index(amzn)

#count values collected in 2012

length(grep("^2012-",sampleTimes))

#count values collected on Mondays in 2012

mon2012 <- table(year(sampleTimes), weekdays(sampleTimes))

mon2012