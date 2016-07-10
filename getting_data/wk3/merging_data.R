#merging data lesson
#download two files covering SAT solutions and review data

if(!file.exists("./data")){dir.create("./data")}

fileURL1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"

fileURL2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
  
download.file(fileURL1,destfile = "./data/reviews.csv",method = "curl")

download.file(fileURL2,destfile = "./data/solutions.csv",method = "curl")

reviews <- read.csv("./data/reviews.csv"); solutions <- read.csv("./data/solutions.csv")

#use merge function to merge data frames
#merge solution_id from reviews with id from solutions
#by.x is your x key, by.y is your y key
#all = TRUE adds in NA for rows with missing values

mergedData = merge(reviews,solutions,by.x = "solution_id",by.y = "id", all = TRUE)

#default merges all common column names
#intersect shows you common column names
#merging without specification just leads to data frame that's larger with multiple rows

intersect(names(solutions),names(reviews))

mergedData2 = merge(reviews,solutions,all = TRUE)

#can use join from the plyr package
#can only merge on basis of common names, couldn't do SAT example above

library(plyr)

df1 = data.frame(id=sample(1:10),x=rnorm(10))
df2 = data.frame(id=sample(1:10),y=rnorm(10))

arrange(join(df1,df2),id)

#however, you can join multiple data frames quickly using join_all

df3 = data.frame(id=sample(1:10),z=rnorm(10))

dfList = list(df1,df2,df3)

dfList1 <- join_all(dfList)