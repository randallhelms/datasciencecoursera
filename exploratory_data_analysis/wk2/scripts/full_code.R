#this covers all steps of the assignment

#load necessary libraries

library(data.table)
library(dplyr)

#download electric data

if(!file.exists("./data")){dir.create("./data")}

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileURL,destfile = "./data/power.zip",method = "curl")

unzip("./data/power.zip") #unzip file

list.files() #find file name

file = "household_power_consumption.txt"

#load data into R

power <- fread(file, na.strings = "?",sep = ";")

#filter data to correct dates

power2 <- filter(power, power$Date=="1/2/2007" | power$Date == "2/2/2007")

#free up memory by removing the big dataset (optional step)

rm(power)

#convert date and time variables to Date/Time class

power2$dateTime <- strptime(paste(power2$Date,power2$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")

#back up to csv

write.table(power2,file = "power.csv",sep = ",",row.names = FALSE)

#save your variables

dt <- power2$dateTime
s1 <- power2$Sub_metering_1
s2 <- power2$Sub_metering_2
s3 <- power2$Sub_metering_3
active <- power2$Global_active_power
vt <- power2$Voltage
rp <- power2$Global_reactive_power

#make first plot

png("plot1.png", width=480, height=480)

hist(active, main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", ylab = "Frequency", col = "red")

dev.off()

#make second plot

png("plot2.png", width=480, height=480)

plot(dt,active,type="l",xlab="",ylab = "Global Active Power (kilowatts)")

dev.off()

#make third plot

png("plot3.png", width=480, height=480)

#start chart with s1

plot(dt,s1,type = "l",xlab = "", ylab = "Energy Sub Metering")

#use lines function to add s2 & s3

lines(dt,s2, col = "red")
lines(dt,s3, col = "blue")

#add legend

legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1)

dev.off()

#make fourth plot

#set number of rows, and size of inner and outer margins

par(mfrow = c(2,2), mar = c(4,4,2,1), oma=c(0,0,2,0))

#create the four plots

with(power2, {
  plot(dt,active,type="l",xlab="",ylab = "Global Active Power (kilowatts)")
  plot(dt,vt,type = "l",xlab = "datetime",ylab = "Voltage")
  plot(dt,s1,type = "l",xlab = "", ylab = "Energy Sub Metering")
  lines(dt,s2, col = "red")
  lines(dt,s3, col = "blue")
  legend("topright", col = c("black","red","blue"),lty = 1,lwd=2,bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))  
  plot(dt,rp,type="l",xlab = "datetime",ylab = "Global_reactive_power")
})

#copy the resulting chart to png format

dev.copy(png, file = "plot4.png",height = 480, width = 480)
dev.off()