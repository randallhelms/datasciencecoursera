#qplot is equivalent to plot in base system
#looks for data in data frame
#plots made up of aesthetics & geoms (points, lines)

#ggplot can do things that qplot cannot

#let's make an example!

library(ggplot2)

str(mpg)

#make scatterplot with displ on x-axis and hwy on y-axis

qplot(displ,hwy, data = mpg)

#modify the colors using a third variable: drv

qplot(displ,hwy,data = mpg, color = drv)

#add a geom - this shows the trend of the data set

qplot(displ,hwy,data = mpg, geom = c("point","smooth"))

qplot(displ,hwy,data = mpg, color = drv,geom = c("point","smooth"))

#make a histogram with a single variable

qplot(hwy,data = mpg,fill = drv)

#facets are like panels in lattice

qplot(displ,hwy,data = mpg,facets = .~ drv)

qplot(hwy,data = mpg,facets = drv~.,binwidth = 2)

#example using the MAACS study

load("./maacs.Rda")

qplot(log(eno),data = maacs, fill = mopos)

#density smooth

qplot(log(eno),data = maacs, geom = "density")

qplot(log(eno),data = maacs, geom = "density", color = mopos)

#make some scatterplots

qplot(log(pm25),log(eno), data = maacs)

qplot(log(pm25),log(eno), data = maacs, shape = mopos) #separate shape by status

qplot(log(pm25), log(eno), data = maacs, color = mopos) #set color by mopos

qplot(log(pm25), log(eno), data = maacs, color = mopos) + geom_smooth(method = "lm")

qplot(log(pm25), log(eno), data = maacs, facets = .~mopos) + geom_smooth(method = "lm") #split them into two charts using facets argument