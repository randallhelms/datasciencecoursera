#1

plot1 <- function(){ if(dir.exists(file.path(getwd(), "Assignment 2"))==FALSE)
{ dir.create(file.path(getwd(), "Assignment 2")) 
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = file.path(getwd(),"Assignment 2", "Assignment2Data.zip")) 
  unzip(file.path(getwd(), "Assignment 2", "Assignment2Data.zip"), exdir = file.path(getwd(), "Assignment 2")) } 
  
  PM25data <- readRDS(file.path(getwd(), "Assignment 2", "summarySCC_PM25.rds")) 
  #make factor variable for year 
  total_emissions <- aggregate(PM25data$Emissions, by = list(PM25data$year), FUN = sum) 
  
  colnames(total_emissions) <- c("Year", "Emissions") 
  total_emissions$Year <- as.factor(total_emissions$Year) 
  
  png("plot1.png") 
  with(total_emissions, barplot(Emissions, names.arg = c("1999", "2002", "2005", "2008"), col = "red", xlab = "Year", ylab = "Total Emissions", main = "Total Emissions 1999 to 2008")) 
  dev.off() }

#2

plot2 <- function(){ if(dir.exists(file.path(getwd(), "Assignment 2"))==FALSE)
  { dir.create(file.path(getwd(), "Assignment 2")) 
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = file.path(getwd(),"Assignment 2", "Assignment2Data.zip")) 
  unzip(file.path(getwd(), "Assignment 2", "Assignment2Data.zip"), exdir = file.path(getwd(), "Assignment 2")) } 
  
  PM25data <- readRDS(file.path(getwd(), "Assignment 2", "summarySCC_PM25.rds")) 
#make factor variable for year 
  baltimore <- PM25data[grep("24510", PM25data$fips),] 
  total_emissions_baltimore <- aggregate(baltimore$Emissions, by = list(baltimore$year), FUN = sum) 
  colnames(total_emissions_baltimore) <- c("Year", "Emissions") 
  png("plot2.png") 
  barplot(total_emissions_baltimore$Emissions, names.arg = c("1999", "2002", "2005", "2008"), col = "blue", xlab = "Year", ylab = "Emissions", main = "Total Emissions Baltimore 1999 to 2008") 
  dev.off() }

#3

plot3 <- function()  { if(dir.exists(file.path(getwd(), "Assignment 2"))==FALSE)
{ dir.create(file.path(getwd(), "Assignment 2")) 
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = file.path(getwd(),"Assignment 2", "Assignment2Data.zip")) 
  unzip(file.path(getwd(), "Assignment 2", "Assignment2Data.zip"), exdir = file.path(getwd(), "Assignment 2")) } 
  PM25data <- readRDS(file.path(getwd(), "Assignment 2", "summarySCC_PM25.rds")) 
  #make factor variable for year 
  baltimore <- PM25data[grep("24510", PM25data$fips),] 
  sum_types <- aggregate(Emissions ~ type, data = baltimore, FUN = sum) 
  library(ggplot2) 
  png("plot3.png") 
  print(ggplot(sum_types, aes(type, Emissions)) + geom_bar(stat = "identity") + ggtitle("Total Emissions per type") + xlab("Type") + ylab("Emissions")) 
  dev.off() }

#4

plot4 <- function(){ if(dir.exists(file.path(getwd(), "Assignment 2"))==FALSE){ 
  dir.create(file.path(getwd(), "Assignment 2")) 
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = file.path(getwd(),"Assignment 2", "Assignment2Data.zip")) 
  unzip(file.path(getwd(), "Assignment 2", "Assignment2Data.zip"), exdir = file.path(getwd(), "Assignment 2")) } 
  #read in both datafiles 
  PM25data <- readRDS(file.path(getwd(), "Assignment 2", "summarySCC_PM25.rds")) 
  Source_Classification <- readRDS(file.path(getwd(), "Assignment 2", "Source_Classification_Code.rds")) 
  #extract SSC codes for only emmissions from coal 
  coaldata <- Source_Classification[grep("Coal$", Source_Classification$EI.Sector),1] 
  #subset 
  PM25data_coal <- subset(PM25data, subset = coaldata %in% PM25data$SCC) 
  PM25data_coal$year <- as.factor(PM25data_coal$year) 
  PM25data_coal_total <- aggregate(PM25data_coal$Emissions, by = list(PM25data_coal$year), FUN = sum) 
  colnames(PM25data_coal_total) <- c("year", "Emissions") 
  library(ggplot2) 
  png("plot4.png") 
  print(ggplot(data = PM25data_coal_total, mapping = aes(year, Emissions)) + geom_bar(stat = "identity") + ylab("Total Emissions") + xlab("Year") + ggtitle("Emissions from coal combustion sources")) 
  dev.off() }

#5

plot5 <- function(){ if(dir.exists(file.path(getwd(), "Assignment 2"))==FALSE){ 
  dir.create(file.path(getwd(), "Assignment 2")) 
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = file.path(getwd(),"Assignment 2", "Assignment2Data.zip")) 
  unzip(file.path(getwd(), "Assignment 2", "Assignment2Data.zip"), exdir = file.path(getwd(), "Assignment 2")) } 
  PM25data <- readRDS(file.path(getwd(), "Assignment 2", "summarySCC_PM25.rds")) 
  Source_Classification <- readRDS(file.path(getwd(), "Assignment 2", "Source_Classification_Code.rds")) 
  index_vehicles <- Source_Classification[grep("Vehicles*", Source_Classification$SCC.Level.Two),1] 
  #make factor variable for year 
  baltimore <- PM25data[grep("24510", PM25data$fips),] 
  baltimore_vehicles <- baltimore[index_vehicles %in% baltimore$SCC,] 
  emissions_baltimore_total <- aggregate(baltimore_vehicles$Emissions, FUN = sum, by = list(baltimore_vehicles$year), simplify = TRUE) 
  colnames(emissions_baltimore_total) <- c("year", "Emissions") 
  emissions_baltimore_total$year <- as.factor(emissions_baltimore_total$year) 
  library(ggplot2) 
  png("plot5.png") 
  print(ggplot(data = emissions_baltimore_total, aes(year, Emissions)) + geom_bar(stat = "identity") + xlab("Year") + ylab("Total Emissions") + ggtitle("Emissions from motor vehicle sources")) 
dev.off() }

#6

plot6 <- function(){ if(dir.exists(file.path(getwd(), "Assignment 2"))==FALSE){ 
  dir.create(file.path(getwd(), "Assignment 2")) 
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = file.path(getwd(),"Assignment 2", "Assignment2Data.zip")) 
  unzip(file.path(getwd(), "Assignment 2", "Assignment2Data.zip"), exdir = file.path(getwd(), "Assignment 2")) } 
  PM25data <- readRDS(file.path(getwd(), "Assignment 2", "summarySCC_PM25.rds")) 
  Source_Classification <- readRDS(file.path(getwd(), "Assignment 2", "Source_Classification_Code.rds")) 
  SSC_vehicles <- Source_Classification[grep("Vehicles*", Source_Classification$SCC.Level.Two), 1] b
  altimore <- PM25data[grep("24510", PM25data$fips),] 
  losangeles <- PM25data[grep("06037", PM25data$fips),] 
  baltimore_vehicles <- baltimore[SSC_vehicles %in% baltimore$SCC,] 
  losangeles_vehicles <- losangeles[SSC_vehicles %in% losangeles$SCC,] 
  baltimore_vehcles_emission <- aggregate(baltimore_vehicles$Emissions, by = list(baltimore_vehicles$year), FUN = sum) 
  losangeles_vehicles_emission <- aggregate(losangeles_vehicles$Emissions, by = list(losangeles_vehicles$year), FUN = sum) 
  total_emissions <- cbind(baltimore_vehcles_emission, losangeles_vehicles_emission) 
  total_emissions <- total_emissions[, c(1, 2, 4)] 
  colnames(total_emissions) <- c("year", "Emissions.baltimore", "Emissions.losangeles") 
  library(ggplot2) 
  png("plot6.png") 
  print(ggplot(total_emissions, aes(x = year)) + geom_line(aes(y = Emissions.baltimore, colour = "Emissions.baltimore")) + geom_line(aes(y=Emissions.losangeles, colour = "Emissions.losangeles")) + xlab("Year") + ylab("Total Emissions") + ggtitle("Comparison between Los Angeles and Baltimore of total emissions")) 
dev.off() }