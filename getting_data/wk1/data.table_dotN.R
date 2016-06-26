#use some of the special vriables in data.table

#.N is an example
#It's an integer, length 1, containing a number

set.seed(123)

DN <- data.table(x=sample(letters[1:3],1E5,TRUE))

DN[,.N, b=x]