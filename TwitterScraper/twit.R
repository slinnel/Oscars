rm(list = ls())

#install.packages("RJSONIO") #, "RCurl", "RJSONIO", "stringr")
library(twitteR)
library(RCurl)
library(RJSONIO)
library(DBI)
library(RSQLite)

api_key = "IA1EdBIUY3pvdWrXZVzW2h"
api_secret = "yIoBnobnV97vmiy3PcneggxTZBLXyYlIXnOIMPpm9lF3gS"
token = "56770-2xav2FB0S8OHGC70W57qTYDQjW21eDVuuCVxRq1J"
token_secret = "xX66YF5XuzZRf0HAe4V7GakSV1YAZrMSILofkKFi9"
db_path = "~/Documents/Senior/second_sem/cpsc482/Oscars/oscar-db.sqlite"

bestPictureCat <- list("Arrival", "Fences", "Hacksaw Ridge", "Hell or High Water",
                    "Hidden Figures", "La La Land", "Lion", "Manchester by the Sea",
                    "Moonlight")
directingCat <- list("Denis Villeneuve", "Mel Gibson", "Damien Chazelle", 
                     "Kenneth Lonergan", "Barry Jenkins")

categories <- list(bestPictureCat, directingCat)
categoriesStr <- list("BestPicture", "Directing")

setup_twitter_oauth(api_key, api_secret, token, token_secret)

con <- dbConnect(SQLite(), dbname=db_path)

i <- 1
for (cat in categories){
  currentCat <- categoriesStr[i]
  for (title in cat){
    qStr = paste(title, "AND", currentCat, sep = " ")
    tweets <- searchTwitter(qStr, n=100, lang="en", since="2017-01-01")
    tweets.df <- twListToDF(tweets)
    dbWriteTable(con, paste(title, currentCat), tweets.df)
  }
  i <- i+1
}
#for cat in Categories
# for title in cat
#   query twitter for title AND cat
#run sentiment on table and get avg.
#tweets <- searchTwitter("Oscars AND 'Best Picture'", n=120, lang="en", since="2017-01-01")
#tweets.df <- twListToDF(tweets)
