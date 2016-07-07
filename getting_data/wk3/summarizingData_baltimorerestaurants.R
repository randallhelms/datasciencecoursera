#summarizing data lesson

#get Baltimore restaurant data from Baltimore city data

if(!file.exists("./data")){dir.create("./data")}

fileURL <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=Download"
  
download.file(fileURL,destfile = "./data/restaurants.csv",method = "curl")

restData <- read.csv("./data/restaurants.csv")

#check out data

head(restData,n=3)

tail(restData,n=3)

summary(restData)

str(restData)

dim(restData) #check dimensions

names(restData) #check column names

#check out quantiles of quantitative variables

quantile(restData$councilDistrict,na.rm = TRUE)

quantile(restData$councilDistrict,probs=c(0.5,0.75,0.9))

#make table
#ifany adds an extra column with NA values

table(restData$zipCode,useNA = "ifany")

#make two dimensional table

table(restData$councilDistrict,restData$zipCode)

#do some counts by different values

count(restData$policeDistrict)

count(restData$zipCode)

#do a scatter plot

plot(count(restData$neighborhood))

#check for missing values

sum(is.na(restData$councilDistrict))

any(is.na(restData$councilDistrict))

all(restData$zipCode > 0)

#check row and column sums

colSums(is.na(restData))

all(colSums(is.na(restData))==0)

#check for values with specific characteristics

table(restData$zipCode %in% c("21212"))

table(restData$zipCode %in% c("21212","21213"))

restData[restData$zipCode %in% c("21212","21213"),]

#check data size

print(object.size(restData),units="Mb")

#attach elements for quicker analysis

attach(restData)

restZip <- count(zipCode)

b_table <- table(policeDistrict,councilDistrict)

write.table(b_table,file="b_table.csv",sep = ",")