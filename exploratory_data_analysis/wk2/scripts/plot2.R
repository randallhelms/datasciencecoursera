#this script assumes that you still have the power2 dataset loaded into R
#if it isn't refer to load_power_data.R

dt <- power2$dateTime
active <- power2$Global_active_power

png("plot2.png", width=480, height=480)

plot(dt,active,type="l",xlab="",ylab = "Global Active Power (kilowatts)")

dev.off()