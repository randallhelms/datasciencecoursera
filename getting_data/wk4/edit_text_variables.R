#editing text variables

#get baltimore speed camera data

if(!file.exists("./data")){dir.create("./data")}

bURL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"

download.file(bURL,destfile = "./data/cameras.csv",method = "curl")

cameraData <- read.csv("./data/cameras.csv")

#have a look at the names

names(cameraData)

#change them to lowercase

tolower(names(cameraData))

#fix character vectors using string split
#in this we split on period

splitNames = strsplit(names(cameraData),"\\.")

#lists

myList = list(letters = c("a","b","c"), numbers = 1:3, matrix(1:25, ncol = 5))

head(myList)

#fix character vectors with sapply
#sapply takes first element of each list

splitNames[[6]][1]

firstElement <- function(x){x[1]}

sapply(splitNames,firstElement) #nice way to remove period from data frame

#find values

grep("Alameda",cameraData$intersection) #finds all rows where Alameda appears

table(grepl("Alameda",cameraData$intersection)) #checks for how often the variable is true

cameraData2 <- cameraData[!grepl("Alameda",cameraData$intersection),] #subsets where Alameda DOESN'T appear

grep("Alameda",cameraData$intersection,value = TRUE) #check where the value appears

grep("JeffStreet",cameraData$intersection) #doesn't exist

length(grep("JeffStreet",cameraData$intersection))