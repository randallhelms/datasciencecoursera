#Continuing with the 'mtcars' dataset from the previous Question, what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?

# find average horsepower of each cylinder type

tapply(mtcars$hp, mtcars$cyl, mean)