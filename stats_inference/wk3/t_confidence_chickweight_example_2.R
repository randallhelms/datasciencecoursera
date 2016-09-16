#chickweight data in R

library(datasets)
data(ChickWeight) #data in a long vector
library(reshape2) 

##define weight gain or loss

  #use dcast to change vector from long to short & wide

wideCW <- dcast(ChickWeight, Diet + Chick ~ Time, value.var = "weight")

names(wideCW)[-(1 : 2)] <- paste("time", names(wideCW)[-(1 : 2)], sep = "")

library(dplyr)

wideCW <- mutate(wideCW,
                 gain = time21 - time0
) #mutate creates a new variable in the data frame

#convert to plot using ggplot2

library(ggplot2)

g <- ggplot(ChickWeight, aes(x = Time, y = weight, 
                             colour = Diet, group = Chick))
g <- g + geom_line()
g <- g + stat_summary(aes(group = 1), geom = "line", fun.y = mean, size = 1, col = "black") #line - mean of each group
g <- g + facet_grid(. ~ Diet) #make a grid of charts by diet
g

#weight gain by diet - make a confidence interval with violin plot

g <- ggplot(wideCW, aes(x = factor(Diet), y = gain, fill = factor(Diet)))
g <- g + geom_violin(col = "black", size = 2)
g

#let's do a t-interval

wideCW14 <- subset(wideCW, Diet %in% c(1, 4)) #take only records from diets 1 and 4
rbind(
  t.test(gain ~ Diet, paired = FALSE, var.equal = TRUE, data = wideCW14)$conf,
  t.test(gain ~ Diet, paired = FALSE, var.equal = FALSE, data = wideCW14)$conf
) #compare gain to diet, and if variables are equal or not
  #results show less weight gain on diet 1 compared to diet 4

wideCW23 <- subset(wideCW, Diet %in% c(2, 3)) #take only records from diets 2 and 3
rbind(
  t.test(gain ~ Diet, paired = FALSE, var.equal = TRUE, data = wideCW23)$conf,
  t.test(gain ~ Diet, paired = FALSE, var.equal = FALSE, data = wideCW23)$conf
)