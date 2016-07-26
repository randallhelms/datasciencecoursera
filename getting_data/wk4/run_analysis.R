##NOTE: UNFINISHED

#reference URL

guide = "https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/"

#download data sets

if(!file.exists("./data")){dir.create("./data")}

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileURL,destfile = "./data/wearables.zip",method = "curl")

unzip("./data/wearables.zip") #unzip file

#load necessary packages

library(data.table)

#read training data into R

setwd("./UCI HAR Dataset")

labels <- fread("activity_labels.txt")

setwd("./UCI HAR Dataset/train")

xtrain <- fread("X_train.txt")
ytrain <- fread("y_train.txt")
subject_train <- fread("subject_train.txt")

setwd("./Inertial Signals")

totalxtrain <- fread("total_acc_x_train.txt")
totalytrain <- fread("total_acc_y_train.txt")
totalztrain <- fread("total_acc_z_train.txt")

accxtrain <- fread("body_acc_x_train.txt")
accytrain <- fread("body_acc_y_train.txt")
accztrain <- fread("body_acc_z_train.txt")

gyroxtrain <- fread("body_gyro_x_train.txt")
gyroytrain <- fread("body_gyro_y_train.txt")
gyroztrain <- fread("body_gyro_z_train.txt")

#merge training data into one dataset

test <- data.table(subject_train,xtrain,ytrain)

#read test data into r

#merge training and test data

#extract mean and std for each measurement

#name the activities

#label the data set

#create new set with averages for
  #each variable
    #each activity
    #each subject

