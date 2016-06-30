#load readr

library(readr)

q5URL = "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"

#pass values into r data set

x <- read_fwf(q5URL,
              skip = 4,
              fwf_widths(c(12,7,4,9,4,9,4,9,4)))

#solve

sum(x[,4])