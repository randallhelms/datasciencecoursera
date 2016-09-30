#4

#Across the United States, how have emissions from 
#coal combustion-related sources changed from 
#1999-2008?

#NOTE: If you have already run plot1.R then you can
#skip lines 10-29, as you will have the data loaded already

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

#find coal combustion SCC values in SCC data and 
#create list

comb <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 

coalComb <- (comb & coal)

#subset NEI using the coal combustion SCC values

combSCC <- SCC[coalComb,]$SCC
combNEI <- NEI[NEI$SCC %in% combSCC,]

#aggregate total emissions by year for coal combustion
#sources

coalTotal <- aggregate(combNEI$Emissions ~ combNEI$year,data = combNEI,sum,na.action = na.omit)

#tidy up the vectors

cEms <- coalTotal$`combNEI$Emissions`
cYr <- coalTotal$`combNEI$year`

#plot the data over time using qplot

qplot(cYr,cEms,data = coalTotal,geom = c("point","smooth"),
      xlab = "Year", ylab = "PM2.5 Emissions (Tons)",
      main = "Coal Combustion Related Emissions, 1999-2008")

#copy the resulting chart to png format

dev.copy(png, file = "plot4.png",height = 480, width = 480)

dev.off()

#Answer to question:

#Coal combustion emissions have fallen over this
#time period