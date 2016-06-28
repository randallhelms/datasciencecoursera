#load jsonlite

library(jsonlite)

# for more info on working with APIs, refer to this:
# https://cran.r-project.org/web/packages/jsonlite/vignettes/json-apis.html

#load httr

library(httr)

# pass application keys

consumer_key = "sJYNNXZfGbqBbbaFGOUyg"

consumer_secret = "N2H30wZRIPopehgIU2Go6HzIbgGvcWQ2V5zN5a7WH0"

#use basic auth

secret <- openssl::base64_encode(paste(consumer_key, consumer_secret, sep = ":"));

req <- httr::POST("https://api.twitter.com/oauth2/token",
                  httr::add_headers(
                    "Authorization" = paste("Basic", secret),
                    "Content-Type" = "application/x-www-form-urlencoded;charset=UTF-8"
                  ),
                  body = "grant_type=client_credentials"
);

#Extract access token

token <- paste("Bearer", content(req)$access_token)

#Actual API call

url <- "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=sonicrampage&count=100"

req <- httr::GET(url, add_headers(Authorization = token))

json <- httr::content(req, as = "text")

tweets <- fromJSON(json)

substring(tweets$text, 1, 100)

#flatten json into list

library(devtools)

source_gist(4205477)

tw1 <- LinearizeNestedList(tweets, LinearizeDataFrames = TRUE)

tw2 <- as.data.frame.list(tw1)

#create new variables

text <- tw2$text
rts <- tw2$retweet_count
faves <- tw2$favorite_count
timestamp <- tw2$created_at

#make new data frame

twitter <- data.frame(timestamp,text,rts,faves)

#turn that into a csv file

write.table(twitter,file="twitter_test.csv",sep = ",")