# clear workspace

rm(list=ls())

# get directory

getwd()

# change directory

setwd()

#check how long the system takes to do something
#this example with readLines function

system.time(readLines("http://www.bbc.com"))

#installing a package

install.packages()

#loading a package

library()

#check what is in the r environment

search()

#order in descending order using plyr or dplyr

desc()

#order by one of the columns in plyr or dplyr

arrange()