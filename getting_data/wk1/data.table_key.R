#create keys

DK <- data.table(x=rep(c("a","b","c"),each=100),y=rnorm(300))

#set your key

setkey(DK,x)

#sort and check your data table super fast
#way to subset data by a certain value

DK['a']