#write a data frame to json
#example uses iris
#pretty makes it easier to read
#good method for creating exportable data

irisJ <- toJSON(iris,pretty = TRUE)

#have a look at it:

cat(irisJ)

#convert it back to a dataframe

iris2 <- fromJSON(irisJ)

#have a look

head(iris2)
