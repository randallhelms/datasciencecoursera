#NOTE: You can skip straight to step 7 if you have already run load_power_data.R

#1 load necessary libraries

library(data.table)
library(dplyr)

#2 download electric data

if(!file.exists("./data")){dir.create("./data")}

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileURL,destfile = "./data/power.zip",method = "curl")

unzip("./data/power.zip") #unzip file

list.files() #find file name

file = "household_power_consumption.txt"

#3 load data into R

power <- fread(file, na.strings = "?",sep = ";")

#4 filter data to correct dates

power2 <- filter(power, power$Date=="1/2/2007" | power$Date == "2/2/2007")

#5 free up memory by removing the big dataset (optional step)

rm(power)

#convert date and time variables to Date/Time class

power2$dateTime <- strptime(paste(power2$Date,power2$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")

#6 back up to csv

write.table(power2,file = "power.csv",sep = ",",row.names = FALSE)

#7 make first plot

active <- as.numeric(power2$Global_active_power)

png("plot1.png", width=480, height=480)

hist(active, main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", ylab = "Frequency", col = "red")

dev.off()