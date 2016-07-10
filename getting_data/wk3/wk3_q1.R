#get data and read it into R

if(!file.exists("./data")){dir.create("./data")}

qURL1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

download.file(qURL1,destfile = "./data/idaho.csv",method = "curl")

idahoACS <- read.csv("./data/idaho.csv")

#create logical vector covering households with:
  #more than 10 acres
  #$10000+ sales of agriculture products

#variable names are the following:

idahoACS$ACR #lot size
idahoACS$AGS #sales of agriculture products

#create logical vector

agricultureLogical = (idahoACS$ACR == 3 & idahoACS$AGS == 6)

#find rows where it is true

which(agricultureLogical)