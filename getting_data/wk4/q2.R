#get GDP data

if(!file.exists("./data")){dir.create("./data")}

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

download.file(fileURL,destfile = "./data/gdp.csv",method = "curl")

gdp <- read.csv("./data/gdp.csv",skip = 4, nrows = 215) #skip the bad stuff

#fix the gdp names and create csv to check

library(data.table)

setnames(gdp, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "gdpRank","fullName", "gdpValue"))

write.table(gdp, file = "./data/gdp_check.csv",sep = ",",row.names = FALSE)

#create new data frame with NA values excluded

gdp2 <- gdp[1:190,]

#remove commas from gdp numbers

gdpNo <- gdp2$gdpValue

gdpNom  <- as.numeric(gsub(",","",gdpNo))

#average the gdp number

mean(gdpNom)