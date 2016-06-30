#webscraping

con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ")

leek = readLines(con)

close(con)

leek

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

#access website with a password

pg1 = GET("http://httpbin.org/basic-auth/user/passwd",
          authenticate("user","passwd"))

names(pg1)

#use handles to save authentication

google = handle("http://google.com")
pg2 = GET(handle=google,path="/")
pg3 = GET(handle = google,path="search")