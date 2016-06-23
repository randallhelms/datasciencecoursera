# create a list with two matrices, one 2x2, the other 3x2

x3 <- list(a = matrix(1:4,2,2), b = matrix(1:6,3,2))

# version using anonymous function to extract first column of each matrix

# function is defined and then used within the context of lapply

# you don't need to write a separate function script and pass it into lapply

# NOTE: don't put a comma after the function or it won't work!

lapply(x3, function(elt) elt[,1])