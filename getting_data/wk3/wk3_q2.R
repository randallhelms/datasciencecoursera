#read jpeg into R

library(jpeg)

jeffURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"

download.file(jeffURL, destfile = "./data/jeff.jpg", method = "curl")

jeffPic = "./data/jeff.jpg"

jeff <- readJPEG(jeffPic,native = TRUE)

#get the 30th and 80th quantiles

quantile(jeff,probs = c(0.3,0.8))