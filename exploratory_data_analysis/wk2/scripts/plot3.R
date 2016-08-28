#this script assumes that you still have the power2 dataset loaded into R
#if it isn't refer to load_power_data.R

#save variables

dt <- power2$dateTime
s1 <- power2$Sub_metering_1
s2 <- power2$Sub_metering_2
s3 <- power2$Sub_metering_3

#start chart

png("plot3.png", width=480, height=480)

#start chart with s1

plot(dt,s1,type = "l",xlab = "", ylab = "Energy Sub Metering")

#use lines function to add s2 & s3

lines(dt,s2, col = "red")
lines(dt,s3, col = "blue")

#add legend

legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1)

dev.off()