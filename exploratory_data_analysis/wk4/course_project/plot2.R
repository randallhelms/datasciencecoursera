#2

#Have total emissions from PM2.5 decreased in the 
#Baltimore City, Maryland (fips == "24510") from 1999 
#to 2008? Use the base plotting system to make a plot 
#answering this question.

#NOTE: If you have already run plot1.R then you can
#skip lines 11-29, as you will have the data loaded already

#download and load data

if(!file.exists("./data")){dir.create("./data")}

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

download.file(fileURL,destfile = "./data/pollution.zip",method = "curl")

unzip("./data/pollution.zip") #unzip file

#load necessary packages

library(data.table)
library(plyr)

#read data into R

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset the baltimore data
fips <- NEI$fips

bmore <- NEI[fips %in% 24510,]

#aggregate emissions by year

bEms <- bmore$Emissions
bYR <- bmore$year

bmorePM25 <- aggregate(bEms ~ bYR,data=bmore,sum,na.action = na.omit)

#plot using the base function

plot(bmorePM25,xlab = "Year",ylab = "Total PM2.5 Emissions (Tons)", main = "Total Emissions in Baltimore, 1999-2008",type = "l",pch = 19)

#copy the resulting chart to png format

dev.copy(png, file = "plot2.png",height = 480, width = 480)

dev.off()

#answer to original question: 
#Yes, emissions have decreased in Baltimore over this 
#time period