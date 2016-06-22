#WEEK 3 - QUESTION 1

#Take a look at the 'iris' dataset that comes with R. The data can be loaded with the code:

library(datasets)
data(iris)

# A description of the dataset can be found by running

?iris

# There will be an object called 'iris' in your workspace. In this dataset, what is the mean of 'Sepal.Length' for the species virginica? Please round your answer to the nearest whole number.

#split species out specifically

sp <- split(iris,iris$Species)

# get means for each species

lapply(sp,function(x) colMeans(x[,c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")]))

# simplified version

sapply(sp,function(x) colMeans(x[,c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")], na.rm = TRUE))