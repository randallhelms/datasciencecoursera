#download data sets

if(!file.exists("./data")){dir.create("./data")}

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileURL,destfile = "./data/wearables.zip",method = "curl")

unzip("./data/wearables.zip") #unzip file

#load necessary packages

library(data.table)
library(plyr)

#read training data into R

setwd("./UCI HAR Dataset")

features <- fread("features.txt")
features$V1 <- NULL #don't need this column

setwd("./train")

xtrain <- fread("X_train.txt")
ytrain <- fread("y_train.txt")
subject_train <- fread("subject_train.txt")

#we're skipping the inertial data, so let's go get the test data

setwd("..")

setwd("./test")

xtest <- fread("X_test.txt")
ytest <- fread("y_test.txt")
subject_test <- fread("subject_test.txt")

#merge training and test data

xMerged <- rbind(xtrain,xtest)
yMerged <- rbind(ytrain,ytest)

#change column names

colnames(xMerged) <- as.character(unlist(features))
colnames(yMerged) = c("activities")

#extract mean and std for each measurement

meanstd_cols <-  grep("(mean|std)\\(\\)",names(xMerged))

xMerged <- subset(xMerged,select = meanstd_cols)

#fix the column names in xMerged

names(xMerged) <- gsub("^t", "Time_", names(xMerged))
names(xMerged) <- gsub("^f", "Frequency_", names(xMerged))
names(xMerged) <- gsub("-mean\\(\\)","_Mean",names(xMerged))
names(xMerged) <- gsub("-std\\(\\)","_Standard_Deviation",names(xMerged))
names(xMerged) <- gsub("-","_",names(xMerged))
names(xMerged) <- gsub("Gyro","_Gyroscope",names(xMerged))
names(xMerged) <- gsub("Acc","_Accelerometer",names(xMerged))
names(xMerged) <- gsub("Jerk","_Jerk",names(xMerged))
names(xMerged) <- gsub("Mag","_Magnitude",names(xMerged))
names(xMerged) <- gsub("BodyBody","Body",names(xMerged))

#add the subjects and set the column name

subjects <- rbind(subject_train,subject_test)

colnames(subjects) <- c("subject_id") 

#merge all three data frames

merged_data <- data.table(xMerged,yMerged,subjects)

#name the activities

merged_data$activities <- mapvalues(
  merged_data$activities,
  from = c("1","2","3","4","5","6"),
  to = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))

#create new set with averages for each variable by
    #each activity
    #each subject

chopped_data <- melt(merged_data,id.vars = c("activities","subject_id"))

tidy_data = dcast(chopped_data, activities + subject_id ~ variable, mean)

#move back to main folder and write the data to csv

setwd("..")
write.table(tidy_data,file = "tidy_data.txt")

#optional: write to CSV if that's what you prefer

write.table(tidy_data,file = "tidy_data.csv",sep = ",",row.names = FALSE)

#optional: read the file back in to double check

tidy_check <- read.table("tidy_data.txt")