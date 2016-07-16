#useful string functions in the stringr package

library(stringr)

nchar("Jeffrey Leek") #count characters

substr("Jeffrey Leek",1,7) #extract or replace substrings, i.e 1-7 letters

paste("Jeffrey","Leek") #paste two strings together with a space

paste0("Jeffrey","Leek") #paste together without a space

str_trim("Jeff     ") #remove extra spaces with string trim