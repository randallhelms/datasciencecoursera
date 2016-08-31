#dimension reduction

#principal componenets analysis
#singular value decomposition

#make a very noisy matrix

set.seed(12345)

par(mar = rep(.2,4))

dataMatrix <- matrix(rnorm(400), nrow = 40)

image(1:10,1:40,t(dataMatrix)[,nrow(dataMatrix):1])

#cluster the data in a dendrogram

par(mar = rep(.2,4))

heatmap(dataMatrix)

#add a pattern to the data

set.seed(678910)

for (i in 1:40) {
  #flip a coin
  coinFlip <- rbinom(1,size=1,prob=0.5)
  #if coin is heads add a common pattern to the row
  if (coinFlip) {
    dataMatrix[i,] <- dataMatrix[i,] + rep(c(0,3),each = 5)
  }
}

par(mar = rep(.2,4))
image(1:10,1:40,t(dataMatrix)[,nrow(dataMatrix):1])

#cluster it again

par(mar = rep(.2,4))

heatmap(dataMatrix)

#patterns in rows and columns

hh <- hclust(dist(dataMatrix))

dataMatrixOrdered <- dataMatrix[hh$order,]

par(mfrow = c(1,3))

image(t(dataMatrixOrdered)[,nrow(dataMatrixOrdered):1])

plot(rowMeans(dataMatrixOrdered),40:1,,xlab = "Row Mean",ylab = "Row",pch = 19)

plot(colMeans(dataMatrixOrdered),xlab = "Column", ylab = "Column Mean", pch = 19)

#useful thing is to compress data in way it can be understood

#singular value decomposition (svd) example

svd1 <- svd(scale(dataMatrixOrdered))

par(mfrow = c(1,3))

image(t(dataMatrixOrdered)[,nrow(dataMatrixOrdered):1])

plot(svd1$u[,1],40:1,,xlab = "Row",ylab = "First left singular vector",pch=19)

plot(svd1$v[,1],xlab = "Column",ylab = "First right singular vector",pch = 19)

#svd with variance

par(mfrow = c(1,2))

plot(svd1$d,xlab = "Column",ylab = "Singular value",pch=19)

plot(svd1$d^2/sum(svd1$d^2),xlab = "Column",ylab = "Prop. of variance explained",pch = 19)

#relationship to principal components

svd1 <- svd(scale(dataMatrixOrdered))

pca1 <- prcomp(dataMatrixOrdered,scale = TRUE)

plot(pca1$rotation[,1],svd1$v[,1],pch=19,xlab= "Principal Component 1",ylab = "Right Singular Vector 1")

abline(c(0,1))

#more examples

constantMatrix <- dataMatrixOrdered*0

for(i in 1:dim(dataMatrixOrdered)[1]){constantMatrix[i,] <- rep(c(0,1),each=5)}

svd1 <- svd(constantMatrix)

par(mfrow = c(1,3))

image(t(constantMatrix)[,nrow(constantMatrix):1])

plot(svd1$d,xlab = "Column",ylab = "Singular value",pch=19)

plot(svd1$d^2/sum(svd1$d^2),xlab = "Column",ylab = "Prop. of variance explained",pch = 19)

#adding a second pattern

set.seed(678910)

for (i in 1:40) {
  #flip a coin
  coinFlip1 <- rbinom(1,size=1,prob=0.5)
  coinFlip2 <- rbinom(1,size=1,prob=0.5)
  #if coin is heads add a common pattern to the row
  if (coinFlip1) {
    dataMatrix[i,] <- dataMatrix[i,] + rep(c(0,3),each = 5)
  }
  if (coinFlip2) {
    dataMatrix[i,] <- dataMatrix[i,] + rep(c(0,3), 5)
  }
}

hh <- hclust(dist(dataMatrix))

dataMatrixOrdered <- dataMatrix[hh$order,]

#svd true patterns

svd2 <- svd(scale(dataMatrixOrdered))

par(mfrow = c(1,3))

image(t(dataMatrixOrdered)[,nrow(dataMatrixOrdered):1])

plot(rep(c(0,1),each=5), xlab = "Column",ylab = "Pattern 1",pch=19)

plot(rep(c(0,1),5),xlab = "Column",ylab = "Pattern 2",pch = 19)

#patterns of variance in rows

svd2 <- svd(scale(dataMatrixOrdered))

par(mfrow = c(1,3))

image(t(dataMatrixOrdered)[,nrow(dataMatrixOrdered):1])

plot(svd2$v[,1], xlab = "Column",ylab = "First right singular vector",pch=19)

plot(svd2$v[,2],xlab = "Column",ylab = "Second right singular vector",pch = 19)

#explaining variance

svd1 <- svd(scale(dataMatrixOrdered))

par(mfrow = c(1,2))

plot(svd1$d,xlab = "Column",ylab = "Singular value",pch=19)

plot(svd1$d^2/sum(svd1$d^2),xlab = "Column",ylab = "Percent of variance explained",pch = 19)

#missing values

dataMatrix2 <- dataMatrixOrdered

dataMatrix2[sample(1:100,size=40,replace = FALSE)] <- NA #add missing data

svdMissing <- svd(scale(dataMatrix2)) #doesn't work

#imputing {impute}

library(impute)

dataMatrix2 <- dataMatrixOrdered

dataMatrix2[sample(1:100,size=40,replace = FALSE)] <- NA #add missing data

dataMatrix2 <- impute.knn(dataMatrix2)$data #imputes missing values from neighbors

svd1 <- svd(scale(dataMatrixOrdered)); svd2 <- svd(scale(dataMatrix2))

par(mfrow=c(1,2));plot(svd1$v[,1],pch=19);plot(svd2$v[,1],pch=19) #impute doesn't have major impact on svd graph

#face example

load("face.rda")

image(t(faceData)[,nrow(faceData):1]) #t is for transpose

faceSVD <- svd(scale(faceData))

plot(faceSVD$d^2/sum(faceSVD$d^2),pch = 19, xlab = "Singular vector",ylab = "Variance explained")

#create approximations of the face

faceSVD <- svd(scale(faceData))

approx1 <- faceSVD$u[,1] %*% t(faceSVD$v[,1]) * faceSVD$d[1] 

# %*% is matrix multiplication
# faceSVD$d[1] is a constant

#make a diagonal matrix out of d

approx5 <- faceSVD$u[,1:5] %*% diag(faceSVD$d[1:5]) %*% t(faceSVD$v[,1:5])

approx10 <- faceSVD$u[,1:10] %*% diag(faceSVD$d[1:10]) %*% t(faceSVD$v[,1:10])

#check the image approximations

par(mfrow=c(1,4))

image(t(approx1)[,nrow(approx1):1], main = "(a)")
image(t(approx5)[,nrow(approx5):1], main = "(b)")
image(t(approx10)[,nrow(approx10):1], main = "(c)")
image(t(faceData)[,nrow(faceData):1], main = "(d)")

#results - approx 5 and 10 are decent, 1 is useless
#can create a decent approximation without having to store all data
#svd is also good for summarizing data