#load jsonlite

library(jsonlite)

# for more info on working with APIs, refer to this:
# https://cran.r-project.org/web/packages/jsonlite/vignettes/json-apis.html

#load httr

library(httr)

# pass application keys

client_id = "418a58a6297c0bb24c2c0bd3e3ac0b4a"

client_secret = "f5cb0ec9ebfe6c9c0087253dd3105b01"

#set user url

srURL <- "http://api.soundcloud.com/users/9879819?client_id=418a58a6297c0bb24c2c0bd3e3ac0b4a"

sr <- fromJSON(srURL)

#get track level data

sr_t <- "http://api.soundcloud.com/users/9879819/tracks?client_id=418a58a6297c0bb24c2c0bd3e3ac0b4a"

pearsallSC <- fromJSON(sr_t)

#count tracks by genre

library(plyr)

count(pearsallSC$genre)

#count plays by genre

genre <- pearsallSC$genre

plays <- pearsallSC$playback_count

aggregate(plays ~ genre, data = pearsallSC, sum)

#pass other columns to their own variables

title <- pearsallSC$title

comments <- pearsallSC$comment_count

dls <- pearsallSC$download_count

likes <- pearsallSC$favoritings_count

#make a new data.frame

sonicrampage <- data.frame(genre,plays,title,comments,dls,likes)
                           
#write that to csv

write.table(sonicrampage,file="soundcloud_test.csv",sep = ",")