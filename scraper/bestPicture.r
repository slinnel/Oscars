#Author: Stephen Linnell
#Date 2-27-16
#This script runs generic linear models on the categories for the oscars

rm(list = ls())

##Begin Best Picture Analysis
##Read in History Data
BestPictureHistory = read.csv("/Users/SteverMac/Oscars/scraper/DataTables/pastdata/picturedata.csv")
##read in the nominees for 2017
BestPicture2017 <- read.csv("/Users/SteverMac/Oscars/scraper/DataTables/2017/2017picture.csv")

#generic linear model
BestPicture.win = glm(oscarwin ~noms + wins + imdbscore + metascore + globewin, family=binomial, data=BestPictureHistory)
#predict on each nominee from 2017
BestPicture.predict<-predict(BestPicture.win, BestPicture2017, type="response")

