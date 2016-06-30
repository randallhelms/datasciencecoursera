#reading from apis

library(httr)

library(openssl)

#save your customer keys

myapp = oauth_app("twitter",
                  key="sJYNNXZfGbqBbbaFGOUyg",secret="N2H30wZRIPopehgIU2Go6HzIbgGvcWQ2V5zN5a7WH0")

#save your tokens

sig = sign_oauth1.0(myapp,
                    token = "119105679-Pl04vtcXSnEdVGOirIVAkquhSXZB4QsNfh2Gd55Z",
                    token_secret = "U9WVhTJ4VVUsbI3U2WorVqHnkeLDc19t4aVwfNSQ")

#make the api call

homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json",sig)

#extract the json data by reformatting data as a 
#data frame, using jsonlite

library(jsonlite)

json1 = content(homeTL)

json2 = jsonlite::fromJSON(toJSON(json1))

#have a look

json2[1,1:4]

#link to Twitter API documentation

twitter_dev = "https://dev.twitter.com/overview/api"
