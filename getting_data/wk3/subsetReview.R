#subset review

set.seed(13435)

X <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))

#scramble variables and put them in a new order, add NA

X <- X[sample(1:5),]; X$var2[c(1,3)] = NA

X

#subset column

X[,1]
X[,"var1"]

#subset by row and column

X[1:2,"var2"]

#Subset using logical statements

#and - uses &

X[(X$var1 <= 3 & X$var3 > 11),]

#or - uses |

X[(X$var1 <= 3 | X$var3 > 15),]

#using the which command for missing values
#returns indices where var2 greater than 8

X[which(X$var2 >8),]

#sort the variables

sort(X$var1)

sort(X$var1,decreasing=TRUE)

sort(X$var2,na.last = TRUE)

#ordering

X[order(X$var1),]

#order by multiple variables

X[order(X$var1,X$var3),]

#order using plyr package

library(plyr)

arrange(X,var1)

arrange(X,desc(var1))

#add rows and columns

X$var4 <- rnorm(5)

Y <- cbind(X,rnorm(5))