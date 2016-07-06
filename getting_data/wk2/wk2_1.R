#launch relevant packages

library(jsonlite)

library(httr)

library(Rcpp)

library(httpuv)

#register with github API

git_id = "0f0a2fd5902ce287334a"

git_secret = "e2e13b19c6faaec7ed7eb1819311088f2c78fdc2"

gitApp <- oauth_app("github", git_id, git_secret)

git_token <- oauth2.0_token(oauth_endpoints("github"),gitApp)

#if problems with git_token, run this

file.remove(".httr-oauth")

#get data

jLeek = "https://api.github.com/users/jtleek/repos"

q1 <- GET(jLeek, config(token = git_token))

stop_for_status(q1)

data <- content(q1)

list(data[[4]]$name, data[[4]]$created_at)