#exploratory graphs 2

#2d:
  #multiple/overlayed 1-d plots (lattice or ggplot2)
  #scatterplots
  #smooth scatterplots

#multiple boxplots

boxplot(readings ~ state, data = epa2, col = "purple")

#multiple histograms

par(mfrow = c(2,1), mar = c(4,4,2,1))

hist(subset(epa2, state == "California")$readings,col = "green")

hist(subset(epa2, state == "Georgia")$readings,col = "pink")

#scatterplot fun

#add latitude to epa2

latitude <- epaData$Latitude

longitude <- epaData$Longitude

epa2 <- aggregate(readings  ~ state + county + latitude + longitude, epaData, mean)

#now make that scatterplot

with(epa2,plot(latitude,readings))

abline(h = 12, lwd = 2, lty = 2) #add a line at the threshold

with(epa2,plot(latitude,readings, col = state)) #add color by state

abline(h = 12, lwd = 2, lty = 2)

#multiple scatterplots

par(mfrow = c(1,2), mar = c(5,4,2,1))

with(subset(epa2,state == "California"), plot(latitude, readings, col = county))

with(subset(epa2,state == "Georgia"), plot(latitude, readings, col = county))

#add region to data set by state

regions <- read.csv("us_regions.csv")

region_st <- regions$name

#make new data set (needs data.table to be loaded)

epa2 <- merge(epa2,regions,by.x = "state",by.y = "name",all = TRUE)

with(epa2,plot(latitude,readings, col = Region))

hist(subset(epa2, Region == "South")$readings,col = "green")

#remove unneccessary columns

epa2$geometry <- NULL

epa2$Color <- NULL

#write file

write.table(epa2, file = "./data/epa2_data.csv",sep = ",",row.names = FALSE) 

#make chart with ggplot2

library(ggplot2)

qplot(readings,Region,data = epa2)