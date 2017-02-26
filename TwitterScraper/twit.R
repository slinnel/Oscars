rm(list = ls())

#install.packages("RJSONIO", "RCurl", "RJSONIO", "stringr")
library(twitteR)
library(RCurl)
library(RJSONIO)
library(DBI)
library(RSQLite)
source("~/Documents/Senior/second_sem/cpsc482/Oscars/queryTwitter.R")


setup_twitter_oauth(api_key, api_secret, token, token_secret)

con <- dbConnect(SQLite(), dbname=db_path)

i <- 1
for (cat in categories){
  currentCat <- categoriesStr[i]
  for (title in cat){
    queryTwitter(title, currentCat)
  }
  i <- i+1
}
dbDisconnect(con)
