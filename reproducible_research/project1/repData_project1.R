library(ggplot2)
library(scales)

#unzip and read in activity data

unzip("activity.zip")

file = "activity.csv"

activity <- read.table(file,header = TRUE,sep = ",")

#have a look at the data

head(activity)

str(activity)

summary(activity)

#clean up the dates

activity$date <- gsub("^.*?-","",activity$date)

steps <- activity$steps
date <- activity$date
interval <- activity$interval

#histogram of total steps taken per day

stepsDay <- aggregate(steps ~ date, data = activity, sum, na.action = na.omit)

ggplot(stepsDay,aes(x=date,y=steps))+
  geom_bar(stat="identity",fill='steelblue',width=1)+
  ggtitle("Total Steps per Day, Oct-Nov 2012")+
  theme(axis.text.x = element_text(angle=90,hjust=1))+
  scale_x_discrete(labels = abbreviate)

ggplot(stepsDay,aes(x=steps))+
  geom_histogram(fill='forestgreen',bins=length(stepsDay$steps)/5)+
  ggtitle("Frequency of total steps per day")+
  xlab("Number of steps")+
  ylab("Frequency")

meanDay <- mean(stepsDay$steps)
medianDay <- median(stepsDay$steps)

#average daily activity pattern

averageActivity <- aggregate(steps ~ interval,data=activity,mean,na.action = na.omit)

ggplot(averageActivity, aes(x=interval,y=steps))+
  geom_line(color="darkorchid3")+
  ggtitle("Average steps taken per 5-minute interval")+
  xlab("Interval Length")+
  ylab("Number of steps")

maxRow <- averageActivity[which.max(averageActivity$steps),] #find and print row with most steps

#imputing missing values

sum(is.na(activity)) #count of missing values in the dataset

activityFull <- activity #create copy of the data set

naValues <- is.na(activityFull$steps) #create logical vector for catching NA steps

intervalAvg <- tapply(activityFull$steps,activityFull$interval,mean,na.rm=TRUE,simplify = TRUE) #calculate mean steps for each interval

activityFull$steps[naValues] <- intervalAvg[as.character(activityFull$interval[naValues])] #replace na values with the mean for their corresponding interval

#calculate total steps per day

stepsDayFull <- aggregate(steps ~ date,data=activityFull,sum,na.action = na.omit)

ggplot(stepsDayFull,aes(x=steps))+
  geom_histogram(fill='darkorchid',bins=length(stepsDay$steps)/5)+
  ggtitle("Frequency of total steps per day \nwith missing values imputed")+
  xlab("Number of steps")+
  ylab("Frequency")

meanDayFull <- mean(stepsDayFull$steps)
medianDayFull <- median(stepsDayFull$steps)

#differences in activity patterns

activityFull$dayname <- weekdays(as.Date(activityFull$date)) #add column for day of the week

activityFull$daytype <- ifelse(activityFull$dayname %in% c('Saturday','Sunday'),'Weekend','Weekday') #use conditional statement to set the type of day in a new column

afFinal <- aggregate(steps ~ interval + daytype,data=activityFull,mean,na.action = na.omit)

ggplot(afFinal, aes(x=interval,y=steps,color=daytype))+
  geom_line()+
  ggtitle("Average steps taken per 5-minute interval:\nWeekdays vs Weekends")+
  xlab("Interval Length")+
  ylab("Number of steps")+
  facet_grid(~daytype)+
  theme(legend.position="none")