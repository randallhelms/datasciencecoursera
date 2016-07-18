#exploratory graphs pt 1

#reasons to use graphs:

#1. understand data properties
#2. to find patterns in data
#3. to suggest modeling strategies
#4. to debug analyses
#5. to communicate results

#goals of exploratory graphs:

#made quickly, made in volume
#help personal understanding
#not 'clean' (that comes later)

#example task: are there counties in the US that exceed national standard for fine particle pollution?

#data available from the US EPA web site

if(!file.exists("./data")){dir.create("./data")}

epaURL = "http://aqsdr1.epa.gov/aqsweb/aqstmp/airdata/daily_88101_2012.zip"

download.file(epaURL,destfile = "./data/daily_88101_2012.zip",method = "curl")

unzip("./data/daily_88101_2012.zip") #unzip file

epaData <- read.csv("daily_88101_2012.csv")

summary(epaData$Arithmetic.Mean)

boxplot(epaData$Arithmetic.Mean, col = "red")

#create new table with averages by state and county

readings <- epaData$Arithmetic.Mean

state <- epaData$State.Name

county <- epaData$County.Name

epa2 <- aggregate(readings  ~ state + county, epaData, mean)

#check the results

head(epa2)

str(epa2)

epa_r <- epa2$readings

summary(epa_r)

#make charts with the readings data

boxplot(epa_r, col = "red")

hist(epa_r,col = "green")

hist(epa_r,col = "green",breaks = 100) #add a bit more detail

plot(epa_r)

#overlay features

hist(epa_r, col = "green")

abline(v = 12, lwd = 2)

abline(v = median(epa_r), col = "purple", lwd = 4) #add purple verticle line at the median

#barplot fun!

barplot(table(state))
