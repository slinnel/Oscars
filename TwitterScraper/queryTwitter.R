#CONSTANTS
#########################################
api_key <- "rDoIA1EdBIUY3pvdWzW2h"
api_secret <- "tkmTyIoBnobnV97vmiy3PcneggxTYlIXnOIMPpm9lF3gS"
token <- "539466770-2xav2FB0S8OHGC70W57qW21eDVuuCVxRq1J"
token_secret <- "xswg8X66YF5XuzZRf0HAe4V7GakSV1YAZrMSFi9"

db_path <- "~/Documents/Senior/second_sem/cpsc482/Oscars/oscar-db3.sqlite"

bestPictureCat <- list("Arrival", "Fences", "Hacksaw Ridge", "Hell or High Water",
                       "Hidden Figures", "La La Land", "Lion", "Manchester by the Sea",
                       "Moonlight")
directingCat <- list("Denis Villeneuve", "Mel Gibson", "Damien Chazelle", 
                     "Kenneth Lonergan", "Barry Jenkins")

categories <- list(bestPictureCat, directingCat)
categoriesStr <- list("Best Picture", "Directing")
##########################################

queryTwitter <- function(title, category){
  
  # "TITLE CATEGORY"
  andQuery = paste(title, category, sep=" ")
  andTweets <- searchTwitter(andQuery, n=1000, since="2017-01-21")
  print(andQuery)
  if(length(andTweets) > 0){
    andTweets.df <- twListToDF(andTweets)
    sumTweets.df <- andTweets.df
  }
  
  # "TITLE #CATEGORY"
  hashQuery = paste(title, " #", gsub(" ", "", category, fixed = TRUE), sep="")
  hashTweets <- searchTwitter(hashQuery, n=1000, since="2017-01-21")
  print(hashQuery)
  if(length(hashTweets) > 0){
    hashTweets.df <- twListToDF(hashTweets)
    sumTweets.df <- rbind(sumTweets.df, hashTweets.df)
  }
  
  # "#TITLE #CATEGORY"
  hashhashQuery = paste("#",gsub(" ", "", title, fixed = TRUE), " #", gsub(" ", "", category, fixed = TRUE), sep="")
  hashhashTweets <- searchTwitter(hashhashQuery, n=1000, since="2017-01-21")
  print(hashhashQuery)
  if(length(hashhashTweets) > 0){
    hashhashTweets.df <- twListToDF(hashhashTweets)
    sumTweets.df <- rbind(sumTweets.df, hashhashTweets.df)
  }
  
  # "TITLE #Oscars"
  oscarQuery = paste(title, " #oscars", sep="")
  oscarTweets <- searchTwitter(oscarQuery, n=1000, since="2017-01-21")
  print(oscarQuery)
  if(length(oscarTweets) > 0){
    oscarTweets.df <- twListToDF(oscarTweets)
    sumTweets.df <- rbind(sumTweets.df, oscarTweets.df)
  }
  
  if(length(sumTweets.df) > 0){
    #sumTweets.df <- merge(andTweets.df, hashTweets.df)
    #sumTweets.df <- merge(sumTweets.df, oscarTweets.df)
    dbWriteTable(con, paste(title, category), sumTweets.df, append= TRUE)
  }
  
}