#exploring beyond qplot in ggplot2

#components of a ggplot2 graphic
  #data frame
  #aesthetic mapping
  #geoms (points, lines,shapes)
  #facets (multiple panels)
  #stats (statistical transformations)
  #scales (male = red, femal = blue)
  #coordinate system

#difference from lattice: build plots in layers

logpm25 <- log(maacs$pm25)
logeno <- log(maacs$eno)

qplot(log(pm25),log(eno), data = maacs, facets = . ~ mopos) + geom_smooth(method = "lm")

g <- qplot(log(pm25),log(eno), data = maacs)

print(g)

#smooth the data to get a trend

g + geom_point() + geom_smooth()

g + geom_point() + geom_smooth(method = "lm")

#add a facet layer

mopos <- log(maacs$mopos)

g + geom_point() + facet_grid(.~ mopos) + geom_smooth(method = "lm")

#remember that ggplot2 will take the labels from the metadata, so make sure it is clean and tidy

#let's play with the aesthetics
#aes function means aesthetics, used for wrapping

g + geom_point(color = "steelblue", size = 4, alpha = 1/2) #set color

g + geom_point(aes(color = mopos), size = 4, alpha = 1/2) #set color by mopos

#modify labels with the labs function

g + geom_point(aes(color = mopos)) + labs(title = "MAACS Cohort") + labs(x = "log 2.5",y = "log ENO")

#add a custom smoother

g + geom_point(aes(color = mopos), size = 2, alpha = 1/2) + geom_smooth(size = 4, linetype = 3, method = "lm", se = FALSE) + labs(title = "MAACS Cohort") + labs(x = "log 2.5",y = "log ENO")

#change the theme

g + geom_point(aes(color = mopos), size = 2, alpha = 1/2) + geom_smooth(size = 4, linetype = 3, method = "lm", se = FALSE) + labs(title = "MAACS Cohort") + labs(x = "log 2.5",y = "log ENO") + theme_bw(base_family = "Times")