#Two group intervals
  
#Rejection rules are the same

library(datasets); data(ChickWeight); library(reshape2)

##define weight gain or loss

wideCW <- dcast(ChickWeight, Diet + Chick ~ Time, value.var = "weight")

names(wideCW)[-(1 : 2)] <- paste("time", names(wideCW)[-(1 : 2)], sep = "")

library(dplyr)

wideCW <- mutate(wideCW,
                 gain = time21 - time0
) #add gain column

wideCW14 <- subset(wideCW, Diet %in% c(1, 4))

#run a two sample t-test

t.test(gain ~ Diet, paired = FALSE, 
       var.equal = TRUE, data = wideCW14)

#try again with var.equal set to FALSE

t.test(gain ~ Diet, paired = FALSE, 
       var.equal = FALSE, data = wideCW14) #no difference in result


