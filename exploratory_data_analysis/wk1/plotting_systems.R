#base plotting system

  #convenient, build up incrementally
  #can't go back once it's started
  #hard to translate to others
  #just a series of r commands

library(datasets)

data(cars)

with(cars, plot(speed,dist))

#second major system is lattice

  #every plot is constructed with a single function call
    #xyplot or bwplot
  #need to specify a lot of information in the call
  #can combine variables or look at multiple variables
  #need to follow conditional model
  #can be awkward, as cannot be annotated

library(lattice)

state <- data.frame(state.x77, region = state.region)

xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1))

#third major system is ggplot2

  #splits difference between base and lattice
  #has automatic functions but allows users to annotate the plot
  #generally easier/more intuitive to use
  #default mode makes choices (but is customizable)

library(ggplot2)

data(mpg)

qplot(displ,hwy,data = mpg) #x = engine size, y = mileage on the highway