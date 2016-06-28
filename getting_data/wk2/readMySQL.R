#load relevant package

library(RMySQL)

#connect to example DB

ucscDb <- dbConnect(MySQL(),user="genome",
                    host="genome-mysql.cse.ucsc.edu")

#check results

dbResult <- dbGetQuery(ucscDb,"show databases;"); dbDisconnect(ucscDb)

#check specific database

hg19 <- dbConnect(MySQL(), user="genome",db="hg19",
                  host="genome-mysql.cse.ucsc.edu")

#list tables

allTables <- dbListTables(hg19)

length(allTables)

#check out fields from a specific table

dbListFields(hg19,"affyU133Plus2")

#execute SQL query within R
#see how many records within the DB

dbGetQuery(hg19,"select count(*) FROM affyU133Plus2")

#extract a specific table to data frame

affyData <- dbReadTable(hg19,"affyU133Plus2")

#select subset of data via SQL query

query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")

#use fetch to grab results of subsetted data

affyMis <- fetch(query); quantile(affyMis$misMatches)

#fetch just a small sample to test 
#use dbClearResult to clear query from remote server

affyMisSmall <- fetch(query,n=10); dbClearResult(query);

dim(affyMisSmall)

#close the connection

dbDisconnect(hg19)