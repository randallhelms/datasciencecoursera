#connect to URL

connection <- url("http://biostat.jhsph.edu/~jleek/contact.html")

q4 <- readLines(connection)

close(connection)

#check values

c(nchar(q4[10]), nchar(q4[20]), nchar(q4[30]), nchar(q4[100]))