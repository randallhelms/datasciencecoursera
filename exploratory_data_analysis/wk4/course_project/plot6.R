#6 

#Compare emissions from motor vehicle sources in 
#Baltimore City with emissions from motor vehicle 
#sources in Los Angeles County, California 
#(fips == "06037"). Which city has seen greater 
#changes over time in motor vehicle emissions?

#NOTE: If you have already run plot1.R then you can
#skip lines 12-31, as you will have the data loaded already

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

#get list of motor vehicle SCC values

motors <- grepl("vehicles",SCC$EI.Sector,ignore.case = TRUE)

motorsSCC <- SCC[motors,]$SCC

#subset motor vehicle SCC values in NEI data set

motorsNEI <- NEI[NEI$SCC %in% motorsSCC,]

#subset fips values for two cities

motors6 <- motorsNEI[motorsNEI$fips %in% c('24510','06037'),]

fips6 <- motors6$fips

#add a new column for city name

motors6 <- mutate(motors6,city = ifelse(grepl("06037",fips6),"Los Angeles",
                                        ifelse(grepl("24510",fips), "Baltimore","Other")))

#aggregate emissions by city and year

q6 <- aggregate(motors6$Emissions ~ motors6$city + motors6$year,data = motors6,sum, na.action = na.omit)

#tidy vectors

qYr <- q6$`motors6$year`
City <- q6$`motors6$city`
qEms <- q6$`motors6$Emissions`

#plot using qplot

qplot(qYr,qEms,data=q6,color = City,geom = c("point","smooth"),
      xlab = "Year",ylab = "PM2.5 Emissions (Tons)",main ="Motor Vehicle Emissions: Los Angeles vs Baltimore, 1999-2008")

#copy the resulting chart to png format

dev.copy(png, file = "plot6.png",height = 480, width = 480)

dev.off()

#Answer to question:

#Los Angeles has seen the larger change in emissions