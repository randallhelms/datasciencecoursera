#dplyr tool intro

chicago <- readRDS("chicago.rds")

names(chicago)

#use dplyr select function to select columns by name
#equivalent to selecting [,1:3]

head(select(chicago,city:dptp))

head(select(chicago,-(city:dptp)))

#doing it without dplyr
#more complicated!

i <- match("city",names(chicago))
j <- match("dptp",names(chicago))

head(chicago[,-(i:j)])

#subset rows by a sequence with filter function
#in this case, all pm25tmean2 rows with value above 30

chic.f <- filter(chicago, pm25tmean2 > 30)

#can do it with more complicated logical sequence
#add multiple filters

chic.ft <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)

#use the arrange function

chicago <- arrange(chicago,date)

chicago <- arrange(chicago,desc(date)) #arrange by date in descending order

#renaming variables

chicago <- rename(chicago, pm25 = pm25tmean2, dewpoint = dptp)

#use mutate function to make new variable, with mean subtracted

chicago <- mutate(chicago, pm25detrend = pm25-mean(pm25,na.rm = TRUE))

#split data frame using categorical variables

chicago <- mutate(chicago, tempcat = factor(1 * (tmpd > 80), labels = c("cold","hot")))

hotcold <- group_by(chicago,tempcat)

#do some summarizing

summarize(hotcold, pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2),no2 = median(no2tmean2))

#categorize by data on other variables
#summarize by year using as.POSIXlt which manipulates calendar dates & times
#use mutate to create new year variable

chicago <- mutate(chicago,year = as.POSIXlt(date)$year + 1900)

years <- group_by(chicago,year)

summarize(years, pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2),no2 = median(no2tmean2))

#use mutate to create month variable
#use pipeline operator to chain a bunch of operations together

chicago %>% mutate(month = as.POSIXlt(date)$mon + 1) %>% group_by(month) %>% summarize(pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))

#other benefits of dplyr@
#work with data.table for fast tables
#can use an SQL interface via DBI