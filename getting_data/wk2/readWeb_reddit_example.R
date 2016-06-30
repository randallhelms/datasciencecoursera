#webscraping

con = url("https://www.reddit.com/r/ukpolitics/comments/4q972b/somebody_needs_to_come_out_and_say_that/")

rUKpol = readLines(con)

close(con)

rUKpol

#parse with XML
#use Jeff Leek

library(XML)

url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ"

html <- htmlTreeParse(url,useInternalNodes = T)

xpathSApply(html, "//title",xmlValue)

#use GET in httr package

library(httr); html2 = GET(url)

content2 = content(html2,as ="text" )

parsedHtml = htmlParse(content2,asText = TRUE)

xpathSApply(parsedHtml,"//title",xmlValue)