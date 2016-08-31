#1

#Have total emissions from PM2.5 decreased in the United 
#States from 1999 to 2008? Using the base plotting 
#system, make a plot showing the total PM2.5 emission 
#from all sources for each of the years 1999, 2002, 
#2005, and 2008.

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

#pass to vectors

pm25 <- (NEI$Emissions)/10^6 #makes it more readable
yr <- NEI$year

#summarize emissions by year

pm25YR <- aggregate(pm25 ~ yr,data = NEI,sum,na.action = na.omit)

#plot using the base function

plot(pm25YR,xlab = "Year",ylab = "Total PM2.5 Emissions (10^6 Tons)", main = "Total Emissions in the United States, 1999 - 2008", type = "l",pch = 19)

#copy the resulting chart to png format

dev.copy(png, file = "plot1.png",height = 480, width = 480)

dev.off()

#answer to original question: 
#yes, total emissions have decreased