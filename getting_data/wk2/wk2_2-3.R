#load sqldf

library(sqldf)

library(data.table)

#download documents

acsURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

doc <- file.path(getwd(),"acsdata.csv")

download.file(acsURL,doc)

#convert to data.table

acs <- data.table(read.csv(doc))

#try queries

q1 <- sqldf("select * from acs")
q2 <- sqldf("select * from acs where AGEP < 50")
q3 <- sqldf("select pwgtp1 from acs where AGEP < 50")
q4 <- sqldf("select pwgtp1 from acs")

#test new functions for question 3

q3 <- unique(acs$AGEP)

q3a1 <- sqldf("select distinct pwgtp1 from acs")
q3a2 <- sqldf("select distinct AGEP from acs")
q3a3 <- sqldf("select AGEP where unique from acs")
q3a4 <- sqldf("select unique AGEP from acs")

q3 == q3a1
q3 == q3a2

#q3a3 and q3a4 have incorrect syntax