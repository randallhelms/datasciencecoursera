x3 <- rnorm(10) #create rnorm list

#create factors

f3 <- gl(2,5) 

f4 <- gl(5,2)

#check out the resulting split list

str(split(x3, list(f3,f4)))

#use drop argument to remove empty values

str(split(x3, list(f3,f4), drop = TRUE))