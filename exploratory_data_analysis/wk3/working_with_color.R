#working with color in r

#default colors are pretty terrible
#customization therefore needed

library(grDevices)

#create new color palettes with these functions:

colorRamp() #take palette of colors and returns extremes of palette

colorRampPalette() #take palette of colors and return function with vector of colors interpolating the palette

colors() #lists names of all colors you can use

heat.colors() #heat map color scheme

topo.colors() #topographical map color scheme

#colorRamp example

pal <- colorRamp(c("red","blue"))

pal(0) #all red

pal(1) #all blue

pal(.5) #half half

pal(.67) #1/3 red, 1/3 blue

pal(seq(0,1,len=10)) #sequence from red to blue

#colorRampPalette example

pal <- colorRampPalette(c("red","yellow"))

pal(2) #red and yellow

pal(10) #sequence from red to yellow

#another recommended package

library(RColorBrewer)

#make 3 types of palettes
  #sequential
  #diverging
  #qualitative

#example time!

cols <- brewer.pal(3,"BuGn")

pal <- colorRampPalette(cols)

image(volcano,col = pal(20))

cols2 <- brewer.pal(6,"Pastel2")
pal2 <- colorRampPalette(cols2)
image(volcano,col=pal2(20))

#try it with the face data

load("face.rda")

image(t(faceData)[,nrow(faceData):1],col=pal2(20))

#other function is smoothScatter

x <- rnorm(10000)
y <- rnorm(10000)

smoothScatter(x,y)
smoothScatter(x,y,colramp = pal2) #change color palette

#more tips

rgb() #produce any color with red, green, blue proportions

library(colorspace) #for more color control

#adding transparency example

plot(x,y,pch=19)

plot(x,y,col = rgb(0,0,0,0.2),pch=19) #add transparency

plot(x,y,col = rgb(0,0.5,0.25,0.2),pch=19) #change color with rgb info