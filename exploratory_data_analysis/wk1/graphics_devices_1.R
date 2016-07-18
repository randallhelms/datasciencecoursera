#graphics devices

#where you make a plot appear:

  #window on computer
  #pdf
  #png or jpeg
  #scalable vector graphics file

#plot is sent to screen device
  #launch in windows with windows()

?Devices #list of devices to send graphics too

#functions for screen device

plot() #base
xyplot() #lattice
qplot() #ggplot2

#secondary plot method:

  #launch graphics device
  #call plotting function to make plot
  #annotate plot if necessary
  #close graphics device

#example - make a pdf

pdf(file = "myplot.pdf")
with(faithful,plot(eruptions,waiting), pch = 20)
title(main = "Old Faithful Geyser data")
dev.off()