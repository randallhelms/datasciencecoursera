#Load the 'mtcars' dataset in R with the following code

library(datasets)
data(mtcars)

# results

4        6        8 
26.66364 19.74286 15.10000

# How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)? Select all that apply.

apply(mtcars, 2, mean) #NO: just gives a mean by column

tapply(mtcars$mpg, mtcars$cyl, mean) #YES: vector is same length as index, and mean is the function

lapply(mtcars, mean) #NO: Just calculates mean value per column

sapply(mtcars, cyl, mean) #NO: 'cyl' is not a function

sapply(split(mtcars$mpg, mtcars$cyl), mean) #YES: Split function chops up mpg and cyl

split(mtcars, mtcars$cyl) #NO: gives values per car, not aggregated by cylinder

tapply(mtcars$cyl, mtcars$mpg, mean) #No: gives cylinder values per mpg value, this is the opposite of what we want

mean(mtcars$mpg, mtcars$cyl) #NO: gives an error

with(mtcars, tapply(mpg, cyl, mean)) #YES: because tapply has the relavent variables(mpg and cyl) and the function (mean)