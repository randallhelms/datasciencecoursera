#get ACS data

if(!file.exists("./data")){dir.create("./data")}

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

download.file(fileURL,destfile = "./data/acs2006.csv",method = "curl")

acs <- read.csv("./data/acs2006.csv")

#split data on character "wgtp"

library(stringr) #load stringr

acsNames <- names(acs) #set names in their own variable 

acs2 <- str_split(acsNames,"wgtp") #split on the names

acs2[[123]] #check the 123rd element