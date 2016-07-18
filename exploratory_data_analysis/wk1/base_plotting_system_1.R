#main core plotting packages

library(graphics)

library(grDevices)

#questions when starting:

  #where will plot be made?
  #where will plot be viewed?
  #how will plot be used?
  #how much data going into the plot?
  #does the graphic need to be dynamically resized?

#can't mix multiple plotting systems in R

#get help for base graphics parameters

?par

#simple histogram

library(datasets)

hist(airquality$Ozone)

#simple scatter

with(airquality,plot(Wind,Ozone))

#simple boxplot

airquality <- transform(airquality, Month = factor(Month))

boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)") #specify axis labels

#key parameters

pch #plotting symbol
lty #line type
lwd #line width
col #color
xlab #x-axis label
ylab #y-axis label

#stuff to specify with par() function

las #orientation of axis labels
bg #background color
mar #margin size
oma #outer margin size
mfrow #number of plots per row / column (filled row-wise)
mfcol #number of plots per row / column (filled column-wise)

par("lty")

par(lty = "dotted")