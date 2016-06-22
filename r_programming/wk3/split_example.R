library(datasets) #load datasets

head(airquality) #check airquality set

s <- split(airquality,airquality$Month) #split by month

lapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")])) #get means for each month

sapply(s, function(x) colMeans(x[,c("Ozone","Solar.R","Wind")], na.rm = TRUE)) # simplify and remove NA values