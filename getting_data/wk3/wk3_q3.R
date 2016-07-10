#get 2 data sets

if(!file.exists("./data")){dir.create("./data")}

q3URL1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

q3URL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

download.file(q3URL1,destfile = "./data/gdp.csv",method = "curl")

download.file(q3URL2,destfile = "./data/education.csv",method = "curl")

#read files into R
#remove the empty rows at the beginning and end of the gdp file

gdp <- read.csv("./data/gdp.csv",skip = 4, nrows = 215)

eduRank <- read.csv("./data/education.csv")

#find country shortcode

head(gdp,n=10) #code is gdp$X

head(eduRank,n=10) #code is eduRank$CountryCode

#fix the gdp names

setnames(gdp, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "gdpRank","fullName", "gdpValue"))

#merge data by country code

q3Merge = merge(gdp,eduRank,by = "CountryCode", all = TRUE)

#write results to csv to check later

write.table(q3Merge, file = "./data/merge.csv",sep = ",")

#count results

sum(!is.na(unique(q3Merge$gdpRank)))

#sort by GDP rank

q3Merge <- arrange(q3Merge,desc(gdpRank))

#find number 13 by GDP rank

q3Merge$fullName[13]

#get average gdp ranking for groups
#remove na values first, then calculate

q4Merge <- q3Merge[1:190,]

iGR <- q4Merge$Income.Group

aggregate(q4Merge[,2],list(iGR),mean)

#split gdp to five quantiles

gr = q4Merge$gdpRank

gq <- quantile(gr, probs = seq(0,1, by = 0.20))

q4Merge$gdpQuantiles <- cut(gr,breaks = gq)

#make table with income group

gQuan = q4Merge$gdpQuantiles

q5 <- table(iGR,gQuan)

q5[5,]