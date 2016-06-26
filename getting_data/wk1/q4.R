#baltimore restaurants data

bmoreXML <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

#pass XML data

bmoreGrub <- xmlTreeParse(file=bmoreXML,useInternal=TRUE)

#check root

bmoreFood <- xmlRoot(bmoreGrub)

#check you can see relevant subsetted info

bmoreFood[[1]][[1]]

#check zipcode info

zips <- xpathSApply(bmoreFood,"//zipcode",xmlValue)

#solve the question

length(zips[zips==21231])
