#course project

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

#1

#Have total emissions from PM2.5 decreased in the United 
#States from 1999 to 2008? Using the base plotting 
#system, make a plot showing the total PM2.5 emission 
#from all sources for each of the years 1999, 2002, 
#2005, and 2008.

pm25 <- (NEI$Emissions)/10^6
yr <- NEI$year

pm25YR <- aggregate(pm25 ~ yr,data = NEI,sum,na.action = na.omit)

plot(pm25YR,xlab = "Year",ylab = "Total PM2.5 Emissions (10^6 Tons)", main = "Total Emissions in the United States, 1999 - 2008", type = "l",pch = 19)

#2

#Have total emissions from PM2.5 decreased in the 
#Baltimore City, Maryland (fips == "24510") from 1999 
#to 2008? Use the base plotting system to make a plot 
#answering this question.

fips <- NEI$fips

bmore <- NEI[fips %in% 24510,]

bEms <- bmore$Emissions
bYR <- bmore$year

bmorePM25 <- aggregate(bEms ~ bYr,data=bmore,sum,na.action = na.omit)

plot(bmorePM25,xlab = "Year",ylab = "Total PM2.5 Emissions (Tons)", main = "Total Emissions in Baltimore, 1999-2008",type = "l",pch = 19)

#3 

#Of the four types of sources indicated by the type 
#(point, nonpoint, onroad, nonroad) variable, which 
#of these four sources have seen decreases in 
#emissions from 1999-2008 for Baltimore City? Which 
#have seen increases in emissions from 1999-2008? 
#Use the ggplot2 plotting system to make a plot 
#answer this question.

library(ggplot2)

bEms <- bmore$Emissions
Type <- bmore$type
bYR <- bmore$year

bmore3 <- aggregate(bEms ~ bType + bYR,data=bmore,sum,na.action = na.omit)

q3 <- ggplot(bmore,aes(bYR,bEms,color = Type))

q3 + geom_line(stat = "summary",fun.y = "sum") +
  ylab(expression('Total PM2.5 Emissions')) +
  xlab(expression('Year')) +
  ggtitle("Total Emissions by Type in Baltimore, 1999 - 2008")

#4

#Across the United States, how have emissions from 
#coal combustion-related sources changed from 
#1999-2008?

#merge on SCC

comb <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 

coalComb <- (comb & coal)

combSCC <- SCC[coalComb,]$SCC
combNEI <- NEI[NEI$SCC %in% combSCC,]

coalTotal <- aggregate(combNEI$Emissions ~ combNEI$year,data = combNEI,sum,na.action = na.omit)

cEms <- coalTotal$`combNEI$Emissions`
cYr <- coalTotal$`combNEI$year`

qplot(cYr,cEms,data = coalTotal,geom = c("point","smooth"),
      xlab = deparse(substitute(Year)), ylab = deparse(substitute(Emissions (Tons))),
      main = "Coal Combustion Related Emissions")

#5

#How have emissions from motor vehicle sources 
#changed from 1999-2008 in Baltimore City?

library(dplyr)

motors <- grepl("vehicles",SCC$EI.Sector,ignore.case = TRUE)

motorsSCC <- SCC[motors,]$SCC
motorsNEI <- NEI[NEI$SCC %in% motorsSCC,]

bMotors <- motorsNEI[motorsNEI$fips %in% 24510,]

bEms <- aggregate(bMotors$Emissions ~ bMotors$year,data = bMotors,sum, na.action = na.omit)

yr5 <- bEms$`bMotors$year`
ems5 <- bEms$`bMotors$Emissions`

q5 <- ggplot(bEms,aes(factor(yr5),ems5)) +
  geom_bar(stat="identity",fill="blue",width=0.8) +
  theme_bw() +guides(fill=FALSE) +
  xlab(expression('Year')) +
  ylab(expression('Total PM2.5 Emissions (Tons)'))+
  ggtitle('Pm2.5 Motor Vehicle Emissions in Baltimore, 1999-2008')

print(q5)

#6 

#Compare emissions from motor vehicle sources in 
#Baltimore City with emissions from motor vehicle 
#sources in Los Angeles County, California 
#(fips == "06037"). Which city has seen greater 
#changes over time in motor vehicle emissions?

motors <- grepl("vehicles",SCC$EI.Sector,ignore.case = TRUE)

motorsSCC <- SCC[motors,]$SCC
motorsNEI <- NEI[NEI$SCC %in% motorsSCC,]

motors6 <- motorsNEI[motorsNEI$fips %in% c('24510','06037'),]

motors6 <- mutate(motors6,city = ifelse(grepl("06037",fips6),"Los Angeles",
                                        ifelse(grepl("24510",fips), "Baltimore","Other")))

q6 <- aggregate(motors6$Emissions ~ motors6$city + motors6$year,data = motors6,sum, na.action = na.omit)

qYr <- q6$`motors6$year`
City <- q6$`motors6$city`
qEms <- q6$`motors6$Emissions`

qplot(qYr,qEms,data=q6,color = City,geom = c("point","smooth"),
      xlab = "Year",ylab = "PM2.5 Emissions (Tons)",main ="Motor Vehicle Emissions: Los Angeles vs Baltimore, 1999-2008")
