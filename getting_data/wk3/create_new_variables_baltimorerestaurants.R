#creating new variables lesson

#reuse baltimore restaurant data

if(!file.exists("./data")){dir.create("./data")}

fileURL <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=Download"

download.file(fileURL,destfile = "./data/restaurants.csv",method = "curl")

restData <- read.csv("./data/restaurants.csv")

#create a sequence

#in this case:
#1 is minimum value, 10 is maximum
#by starts at 1 and creates new values every 2

s1 <- seq(1,10,by=2); s1

#create another one
#1 is minimum value, 10 is maximum
#3 values to generate

s2 <- seq(1,10,length=3); s2

#create another one
#loops over those five values

t <- c(1,3,8,25,100); seq(along = t)

#subset variables to create new variable

restData$nearMe = restData$neighborhood %in% c("Roland Park","Homeland")

table(restData$nearMe)

#create binary variables

restData$zipWrong = ifelse(restData$zipCode < 0,TRUE, FALSE)

table(restData$zipWrong)

#create categorical variables

restData$zipgroups = cut(restData$zipCode,breaks=quantile(restData$zipCode))

table(restData$zipgroups)

table(restData$zipgroups,restData$zipCode)

#easier method for cutting
#g equals number of quantile groups

library(Hmisc)

restData$zipgroups = cut2(restData$zipCode,g=4)

#create factor variables

restData$zcf <- factor(restData$zipCode)

restData$zcf[1:10]

#working with levels of factor variables

#make a dummy vector

yesno <- sample(c("yes","no"),size=10,replace=TRUE)

#by default will treat lowest value alphabetically as first value in the factor variable
#can use levels to set order

yesnofac <- factor(yesno,levels=c("yes","no"))

#use relevel to set reference class

relevel(yesnofac,ref = "yes")

#change factor variable back to numeric variable

as.numeric(yesnofac)

#use the mutate function to simultaneously:
#create new version of variable
#add it to dataset

library(Hmisc); library(plyr)

restData2 = mutate(restData,zipgroups=cut2(zipCode,g=4))

table(restData2$zipgroups)