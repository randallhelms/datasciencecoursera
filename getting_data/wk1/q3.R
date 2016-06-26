#download excel sheet

gas_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"

#download file

download.file(gas_url, destfile = "C:\\Users\\Randall\\rhelms_data\\datasciencecoursera\\getting_data\\wk1\\gas_program.xlsx", method = "curl")

#check it's there

list.files("C:\\Users\\Randall\\rhelms_data\\datasciencecoursera\\getting_data\\wk1")
ins

#load XLConnect

library(XLConnect)

#doesn't work - fuck! Java problem

#open in Excel, extract the relevant rows, save to new CSV

gas2 <- read.csv("gas2.csv")

#run formula

sum(gas2$Zip*gas2$Ext,na.rm=T)