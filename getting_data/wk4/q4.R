#get 2 data sets

if(!file.exists("./data")){dir.create("./data")}

q4URL1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

q4URL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

download.file(q4URL1,destfile = "./data/gdp.csv",method = "curl")

download.file(q4URL2,destfile = "./data/education.csv",method = "curl")

#read files into R
#remove the empty rows at the beginning and end of the gdp file

gdp <- read.csv("./data/gdp.csv",skip = 4, nrows = 215)

eduRank <- read.csv("./data/education.csv")

#fix the gdp names

setnames(gdp, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "gdpRank","fullName", "gdpValue"))

#merge data by country code

q4Merge = merge(gdp,eduRank,by = "CountryCode", all = TRUE)

#write results to csv to check later

write.table(q4Merge, file = "./data/merge.csv",sep = ",",row.names = FALSE)

#isolate the accounts base year

accountsYear = q4Merge$Special.Notes

#find the instances

grep("^Fiscal year end: June",accountsYear)

#count them

length(grep("^Fiscal year end: June",accountsYear))