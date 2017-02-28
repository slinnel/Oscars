#CONSTANTS
#########################################
api_key <- "rDIIUY3pvdWrXZVzW2h"
api_secret <- "tkmTyIiy3PcneggxTZBLXyYlIXnOIMPpm9lF3gS"
token <- "530-2xav2FB0S8OHGC70W57qTYDQjW21eDVuuCVxRq1J"
token_secret <- "xswf0HAe4V7GakSV1YAZrMSILofkKFi9"

db_path <- "~/Documents/Senior/second_sem/cpsc482/Oscars/oscar-db4.sqlite"

bestPictureCat <- list("Arrival", "Fences", "Hacksaw Ridge", "Hell or High Water",
                       "Hidden Figures", "La La Land", "Lion", "Manchester by the Sea",
                       "Moonlight")

directingCat <- list("Denis Villeneuve", "Mel Gibson", "Damien Chazelle", 
                     "Kenneth Lonergan", "Barry Jenkins")
actorCat <- list("Casey Affleck", "Andrew Garfield", "Ryan Gosling", "Viggo Mortensen",
                    "Denzel Washington")
actressCat <- list("Isabelle Huppert", "Ruth Negga", "Natalie Portman", "Emma Stone", "Meryl Streep")
supactCat <- list("Mahershala Ali", "Jeff Bridges", "Lucas Hedges", "Dev Patel", "Michael Shannon")
#categories <- list(bestPictureCat, directingCat, actorCat, actressCat)
#categoriesStr <- list("Best Picture", "Directing", "Best Actor", "Best Actress")
categories <- list(supactCat)
categoriesStr <- list("Supporting Role")
##########################################
queryTwitterPic <- function(best.2015){
  for (each in best.2015){
    query2015 = paste(each, "Best Picture", sep=" ")
    tweets2015 <- searchTwitter(query2015, n=1000, since="2014-04-01", until="2015-02-22")
    if(length(tweets2015) > 0){
      tweets2015.df <- twListToDF(tweets2015)
      sumTweets.df <- tweets2015.df
    }
    
    hashQuery2015 = paste(each, " #oscars", sep=" ")
    hashTweets2015 <- searchTwitter(hashQuery2015, n=1000, since="2014-04-01", until="2015-02-22")
    if(length(hashTweets2015) > 0){
      hashTweets2015.df <- twListToDF(hashTweets2015)
      sumTweets.df <- rbind(sumTweets.df, hashTweets2015.df)
    }
    if(length(sumTweets.df) > 0){
      #sumTweets.df <- merge(andTweets.df, hashTweets.df)
      #sumTweets.df <- merge(sumTweets.df, oscarTweets.df)
      dbWriteTable(con, paste(each, "BestPic2015"), sumTweets.df, append= TRUE)
    }
  }
}
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
    dbWriteTable(con, paste(title, category), sumTweets.df, append= TRUE)
  }
  
}
