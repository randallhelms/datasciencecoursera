#try joining tables

#create two tables

DT1 <- data.table(x=c('a','a','b','dt1'),y=1:4)
DT2 <- data.table(x=c('a','b','dt2'),z=5:7)

#choose your keys for joining

setkey(DT1,x);setkey(DT2,x)

#join them

merge(DT1,DT2)