#this script assumes that you still have the power2 dataset loaded into R
#if it isn't refer to load_power_data.R

dt <- power2$dateTime
s1 <- power2$Sub_metering_1
s2 <- power2$Sub_metering_2
s3 <- power2$Sub_metering_3
active <- power2$Global_active_power
vt <- power2$Voltage
rp <- power2$Global_reactive_power

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