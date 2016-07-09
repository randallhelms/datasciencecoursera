#reshaping data lesson
#how to make your data tidy!

library(reshape2)
head(mtcars)

#first step is to melt the data set
#melt function says which variables are id and which are measures
#reshapes data set to make it tall and skinny

mtcars$carname <- rownames(mtcars)

carMelt <- melt(mtcars,id=c("carname","gear","cyl"),measure.vars=c("mpg","hp"))

head(carMelt,n=3)

tail(carMelt,n=3)

#once it is melted, the data set can be re-cast
#dcast runs with data, formula, then function
#so this is 'use carMelt, compare cyl & variable by median/mean'

cylData2 <- dcast(carMelt,cyl ~ variable,median)

cylData <- dcast(carMelt,cyl ~ variable, mean)

#averaging values

head(InsectSprays)

tapply(InsectSprays$count,InsectSprays$spray,sum) #creates sum by InsectSprays$spray

#alternate method using split

spIns = split(InsectSprays$count,InsectSprays$spray)

sprCount = lapply(spIns,sum) #lapply applies sum across every element of spIns list

#third method is to unlist

unlist(sprCount)

sapply(spIns,sum) #apply sum to all elements of list

#use plyr
#sum up the count in InsectSprays

library(plyr)

ddply(InsectSprays,.(spray),summarize,sum=sum(count))

#create a new variable
#sum variable is ave function applied to InsectSprays$count, with the sum function
#can now add this to the data set for different analyses

spraySums <- ddply(InsectSprays,.(spray),summarize,sum=ave(count,FUN=sum))

#other useful functions

acast() #multi-dimensional arrays

arrange() #faster reordering

mutate()