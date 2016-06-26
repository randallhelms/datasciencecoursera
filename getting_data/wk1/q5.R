#question 5

q5_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

#download the file, default method is ok for windows

download.file(q5_url, destfile = "C:\\Users\\Randall\\rhelms_data\\datasciencecoursera\\getting_data\\wk1\\acs_2006_ih.csv", method = "curl")

#check it's there

list.files("C:\\Users\\Randall\\rhelms_data\\datasciencecoursera\\getting_data\\wk1")

#load into R object using fread

DT <- fread("acs_2006_ih.csv")