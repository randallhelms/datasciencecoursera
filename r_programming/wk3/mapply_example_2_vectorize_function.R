# create a function called noise that passes the mean and sd for some random numbers

noise <- function(n, mean, sd) {
  rnorm(n, mean, sd)
}

# pass mean of 1 with sd of 2

noise(5,1,2)

# pass 1:5 vector for n, mean of 1:5, sd of 2
# will receive a list of five values
# what you want is 1 with mean 1, 2 with mean 2, etc

noise(1:5,1:5,2)

# vectorize it with mapply to get what you wanted in previous example

mapply(noise, 1:5, 1:5, 2)

# this is the equivalent of manually typing this:

list(noise(1,1,2), noise(2,2,2), noise(3,3,2), 
     noise(4,4,2), noise(5,5,2))