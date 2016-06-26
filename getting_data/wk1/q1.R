#question 1

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

#download the file, default method is ok for windows

download.file(fileURL, destfile = "C:\\Users\\Randall\\rhelms_data\\datasciencecoursera\\getting_data\\wk1\\2006_microdata_survey.csv", method = "curl")

#check it's there

list.files("C:\\Users\\Randall\\rhelms_data\\datasciencecoursera\\getting_data\\wk1")

#load into R

micro_2006 <- read.csv("2006_microdata_survey.csv")

#make a table for VAL

val1 <- table(micro_2006$VAL)

#subset to see the VAL of 24 ($1mil+ houses)

val1[names(val1)==24]