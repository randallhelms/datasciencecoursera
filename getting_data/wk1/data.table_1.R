#load the data.table library

library(data.table)

#create a data frame

DF = data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))

#have a look at the first three rows

head(DF,3)

#make a data table with same arguments

DT = data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))

#check first three rows

head(DT,3)

#check tables in memory

tables()

#subset rows in different ways

DT[2,]

DT[DT$y=="a",]

#new subset method - i.e. 2nd & 3rd rows

DT[c(2,3)]

#calculate values for variables with expressions

DT[,list(mean(x),sum(z))]

#can perform other functions with data table

DT[,table(y)]

#can add new columns

DT[,w:=z^2]

#make copy

DT2 <- DT

#change values

DT[,y:= 2]

#perform multiple operations

DT[,m:= {tmp <- (x+2); log2(tmp+5)}]

#do plyr like operations

DT[,a:=x>0]

DT[,b:= mean(x+w),by=a]