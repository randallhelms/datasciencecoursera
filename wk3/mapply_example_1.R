# mapply can take a function and apply it in parallel over a set of arguments

# long-winded list that takes a while to type

# repeats 1 four times
# repeats 2 three times
# repeats 3 two times
# repeats 4 one time

x <- list(rep(1,4),rep(2,3), rep(3,2),rep(4,1))

# quicker way, same result

# What's happening:
# rep is the repeat function
# first set of args is 1 to 4
# second set of args is 4 to 1

x1 <- mapply(rep, 1:4, 4:1)