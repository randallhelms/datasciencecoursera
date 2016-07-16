#edit_text_variables second bit

#download two files covering SAT solutions and review data

if(!file.exists("./data")){dir.create("./data")}

fileURL1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"

fileURL2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"

download.file(fileURL1,destfile = "./data/reviews.csv",method = "curl")

download.file(fileURL2,destfile = "./data/solutions.csv",method = "curl")

reviews <- read.csv("./data/reviews.csv"); solutions <- read.csv("./data/solutions.csv")

head(reviews,2)

head(solutions,2)

#fixing character vectors with substitution
#example: remove underscore

names(reviews)

sub("_","",names(reviews),)

#use gsub to replace multiple instances

testName <- "this_is_a_test"

sub("_","",testName) #doesn't quite work

gsub("_","",testName) #this one works!