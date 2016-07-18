#base plotting system - lesson 2

plot() #scatterplot
lines() #adds lines to a plot
points() #adds points to a plot
text() #adds text to a plot
title() #adds title to a plot
mtext() #adds margin text
axis() #adds axis ticks/labels

#example with annotation

library(datasets)

with(airquality, plot(Wind,Ozone))

title(main = "Ozone and Wind in New York City") #add title

with(airquality, plot(Wind,Ozone, main = "Ozone and Wind in New York City"))

#subset to change color of May data

with(subset(airquality, Month == 5), points(Wind,Ozone, col = "blue"))

#set the plot up but don't plot anything

with(airquality, plot(Wind,Ozone, main = "Ozone and Wind in New York City", type = "n"))

with(subset(airquality, Month == 5), points(Wind,Ozone, col = "blue"))

with(subset(airquality, Month != 5), points(Wind,Ozone, col = "red"))

#add a legend

legend("topright", pch = 1, col = c("blue","red"), legend = c("May","Other Months"))

#add a regression line

with(airquality, plot(Wind,Ozone, main = "Ozone and Wind in New York City", pch = 20))

model <- lm(Ozone ~ Wind, airquality) #lm fits a linear model

abline(model, lwd = 2) #adds a line to the plot

#multiple base plots

par(mfrow = c(1,2)) #1 row, 2 columns

with(airquality, {
  plot(Wind,Ozone, main = "Ozone and Wind")
  plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
})

#multiple base plots pt II

par(mfrow = c(1,3), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(airquality, {
  plot(Wind,Ozone, main = "Ozone and Wind")
  plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
  plot(Temp, Ozone, main = "Ozone and Temperature")
  mtext("Ozone and Weather in New York City", outer = TRUE)
})