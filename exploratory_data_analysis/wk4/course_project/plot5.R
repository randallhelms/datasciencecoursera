#5

#How have emissions from motor vehicle sources 
#changed from 1999-2008 in Baltimore City?

#NOTE: If you have already run plot1.R then you can
#skip lines 9-28, as you will have the data loaded already

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

#create motor vehicle SCC list

motors <- grepl("vehicles",SCC$EI.Sector,ignore.case = TRUE)

motorsSCC <- SCC[motors,]$SCC

#subset motor vehicle SCC rows from NEI dataset

motorsNEI <- NEI[NEI$SCC %in% motorsSCC,]

#subset Baltimore fips rows

bMotors <- motorsNEI[motorsNEI$fips %in% 24510,]

#aggregate Baltimore motor vehicle emissions by year

bEms <- aggregate(bMotors$Emissions ~ bMotors$year,data = bMotors,sum, na.action = na.omit)

#tidy up

yr5 <- bEms$`bMotors$year`
ems5 <- bEms$`bMotors$Emissions`

#plot using ggplot

q5 <- ggplot(bEms,aes(factor(yr5),ems5)) +
  geom_bar(stat="identity",fill="blue",width=0.8) +
  theme_bw() +guides(fill=FALSE) +
  xlab(expression('Year')) +
  ylab(expression('Total PM2.5 Emissions (Tons)'))+
  ggtitle('Pm2.5 Motor Vehicle Emissions in Baltimore, 1999-2008')

print(q5)

#copy the resulting chart to png format

dev.copy(png, file = "plot5.png",height = 480, width = 480)

dev.off()

#Answer to question:

#Motor vehicle emissions have fallen in Baltimore over
#the relevant time period