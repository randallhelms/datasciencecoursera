#load jsonlite

library(jsonlite)

#pass data from Github API

jsonData <- fromJSON("http://api.github.com/users/randallhelms/repos")

#drill down to names

names(jsonData)

#drill down to owner

names(jsonData$owner)

#drill down to specific something

jsonData$owner$url