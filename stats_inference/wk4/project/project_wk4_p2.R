#load relevant libraries

library(ggplot2)
library(psych)
library(car)
library(plyr)
library(extrafont)
library(RColorBrewer)

#load data

data("ToothGrowth")

#part 1: basic summary of the data

head(ToothGrowth)

summary(ToothGrowth)

str(ToothGrowth)

describe(ToothGrowth)

#part 2

aggregate(len ~ dose + supp, data=ToothGrowth,mean)

par(mfrow = c(2,1)) #set 

ggplot(ToothGrowth, aes(x = supp, y = len)) + 
  geom_boxplot(aes(fill=supp),notch=TRUE) +
  scale_fill_brewer(palette = "Spectral")+
  xlab("Supplement Delivery Method")+
  ylab("Tooth Length")+
  ggtitle("10 Little Guinea Piggies:\nTooth Length vs. Delivery Method")

ggplot(ToothGrowth, aes(x = supp, y = len)) + 
  geom_boxplot(aes(fill=supp),notch=TRUE) +
  facet_grid(~ dose)+
  scale_fill_brewer(palette = "Spectral")+
  xlab("Supplement Delivery Method")+
  ylab("Tooth Length")+
  ggtitle("10 Little Guinea Piggies:\nTooth Length vs. Delivery Method \nby Dose Amount")

aggregate(len ~ dose, data=ToothGrowth,mean)

ToothGrowth$dose<-as.factor(ToothGrowth$dose)

ggplot(ToothGrowth, aes(x = dose, y = len)) + 
  geom_boxplot(aes(fill=dose),notch = TRUE) +
  scale_fill_brewer(palette = "Accent")+
  xlab("Dose Amount")+
  ylab("Tooth Length")+
  ggtitle("Tooth Length vs. Dose Amount \n for 10 Guinea Pigs")

ggplot(ToothGrowth, aes(x = dose, y = len)) + 
  geom_boxplot(aes(fill=dose),notch = TRUE) +
  facet_grid(~ supp)+
  scale_fill_brewer(palette = "Accent")+
  xlab("Dose Amount")+
  ylab("Tooth Length")+
  ggtitle("Tooth Length vs. Dose Amount \nby Delivery Method for 10 Guinea Pigs")

#create a t-test for ToothGrowth

n <- nrow(ToothGrowth)
se <- sd(ToothGrowth$len) / sqrt(n)
sd <- se * sqrt(n)

tgMeans <- ddply(ToothGrowth,.(dose), summarize,mean=mean(len))
mean0Point5 = 10.605
mean1 = 19.735
mean2 = 26.100

tgTest1 <- subset(ToothGrowth,dose %in% c(0.5,1))
t.test(len~dose,data=tgTest1,paired = FALSE, var.equal = FALSE)
       
tgTest2 <- subset(ToothGrowth,dose %in% c(1,2))
t.test(len~dose,data=tgTest2,paired = FALSE, var.equal = FALSE)

tgTest3 <- subset(ToothGrowth,dose %in% c(0.5,2))
t.test(len~dose,data=tgTest3,paired = FALSE, var.equal = FALSE)

mean_diff <- sum(ToothGrowth$len) / n
sd_diff <- sqrt((sum(ToothGrowth$len - mean_diff)^2) / (n-1))
t_obs <- mean_diff / (sd_diff / sqrt(n))

t.test(len~supp,data=ToothGrowth)
t.test(len~dose,data=dose1)