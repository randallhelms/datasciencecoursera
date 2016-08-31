#3

#Of the four types of sources indicated by the type 
#(point, nonpoint, onroad, nonroad) variable, which 
#of these four sources have seen decreases in 
#emissions from 1999-2008 for Baltimore City? Which 
#have seen increases in emissions from 1999-2008? 
#Use the ggplot2 plotting system to make a plot 
#answer this question.

#NOTE: If you have already run plot1.R then you can
#skip lines 14-33, as you will have the data loaded already

#download and load data

if(!file.exists("./data")){dir.create("./data")}

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

download.file(fileURL,destfile = "./data/pollution.zip",method = "curl")

unzip("./data/pollution.zip") #unzip file

#load necessary packages

library(data.table)
library(plyr)
library(ggplot2)

#read data into R

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset Baltimore data

fips <- NEI$fips

bmore <- NEI[fips %in% 24510,]

#make tidy vectors of your key columns (I like doing it like this)

bEms <- bmore$Emissions
Type <- bmore$type
bYR <- bmore$year

#make the plot using ggplot

q3 <- ggplot(bmore,aes(bYR,bEms,color = Type))

q3 + geom_line(stat = "summary",fun.y = "sum") +
  ylab(expression('Total PM2.5 Emissions (Tons)')) +
  xlab(expression('Year')) +
  ggtitle("Total Emissions by Type in Baltimore, 1999 - 2008")

#copy the resulting chart to png format

dev.copy(png, file = "plot3.png",height = 480, width = 480)

dev.off()

#Answer to question:

#Of the four sources, nonpoint, on-road, and non-road
#have seen declines in emissions; the only type to see
#increases is point