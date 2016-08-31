#case study intro - Samsung data analysis

library(data.table)

load("data/samsungData.rda")

names(samsungData)[1:12]

table(samsungData$activity)

#let's play with the data

#average acceleration, mayne

par(mfrow = c(1,2),mar = c(5,4,1,1))

samsungData <- transform(samsungData,activity = factor(activity))

sub1 <- subset(samsungData,subject == 1)

plot(sub1[,1], col = sub1$activity, ylab = names(sub1)[1])

plot(sub1[,2], col = sub1$activity, ylab = names(sub1)[2])

legend("bottomright", legend = unique(sub1$activity),col = unique(sub1$activity),pch = 1)

#cluster based on average acceleration

source("myplclust.R")

distanceMatrix <- dist(sub1[,1:3])

hclustering <- hclust(distanceMatrix)

myplclust(hclustering,lab.col = unclass(sub1$activity)) #creates a crazy big mess

#plot the max acceleration

par(mfrow = c(1,2))

plot(sub1[,10], pch = 19, col = sub1$activity, ylab = names(sub1)[10])

plot(sub1[,11], pch = 19, col = sub1$activity, ylab = names(sub1)[11])

#cluster based on max acceleration

distanceMatrix2 <- dist(sub1[,10:12])

hclustering2 <- hclust(distanceMatrix2)

myplclust(hclustering2, lab.col = unclass(sub1$activity)) #a bit tidier, but not yet perfect

#singular value decomposition (svd)
#method of clustering data by activity

svd1 = svd(scale(sub1[,-c(562,563)]))

par(mfrow = c(1,2))

plot(svd1$u[,1], pch = 19, col = sub1$activity) #separates moving from non-moving activities

plot(svd1$u[,2], pch = 19, col = sub1$activity) #separates walking down/up from other events

#find maximum contributor

plot(svd1$v[,2],pch=19)

maxContrib <- which.max(svd1$v[,2])

distanceMatrix3 <- dist(sub1[,c(10:12,maxContrib)])

hclustering3 <- hclust(distanceMatrix3)

myplclust(hclustering3, lab.col = unclass(sub1$activity)) #clear clusters by activity, still noisy looking

#check new clustering

names(samsungData)[maxContrib]

#k-means clustering

kClust <- kmeans(sub1[,-c(562,563)],centers = 6)

table(kClust$cluster,sub1$activity)

kClust <- kmeans(sub1[,-c(562,563)],centers = 6,nstart = 100) #6 clusters, with 100 random sets

table(kClust$cluster,sub1$activity)

plot(kClust$center[1,1:10],pch = 19, ylab = "Cluster Center", xlab = "") #laying

plot(kClust$center[4,1:10],pch = 19, ylab = "Cluster Center", xlab = "") #walking