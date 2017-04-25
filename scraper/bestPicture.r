#Author: Stephen Linnell
#Date 2-27-16
#This script runs generic linear models on the categories for the oscars
library(ISLR)
library(boot)
rm(list = ls())


##Begin Best Picture Analysis
##Read in History Data
BestPictureHistory = read.csv("/Users/SteverMac/Oscars/scraper/DataTables/pastdata/picturedata.csv")
attach(BestPictureHistory)
##read in the nominees for 2017
BestPicture2017 <- read.csv("/Users/SteverMac/Oscars/scraper/DataTables/2017/2017picture.csv")

#generic linear model
BestPicture.win = glm(oscarwin~noms + wins + imdbscore + metascore, family=binomial, data=BestPictureHistory)
summary(BestPicture.win)
BestPicture.win1 = glm(oscarwin ~noms + wins + imdbscore + metascore , family=binomial, data=BestPictureHistory)
BestPicture.win2 = glm(oscarwin ~noms + imdbscore + metascore + globewin, family=binomial, data=BestPictureHistory)
BestPicture.win3 = glm(oscarwin ~noms + wins + imdbscore, family=binomial, data=BestPictureHistory)
BestPicture.win4 = glm(oscarwin ~noms + wins + metascore, family=binomial, data=BestPictureHistory)
BestPicture.win5 = glm(oscarwin ~noms + wins + imdbscore + metascore , family=binomial, data=BestPictureHistory)
BestPicture.win6 = glm(oscarwin ~wins + imdbscore + metascore, family=binomial, data=BestPictureHistory)


#predict on each nominee from 2017
BestPicture.predict<-predict(BestPicture.win, BestPicture2017, type="response")
BestPicture.predict1<-predict(BestPicture.win1, BestPicture2017, type="response")
BestPicture.predict2<-predict(BestPicture.win2, BestPicture2017, type="response")
BestPicture.predict3<-predict(BestPicture.win3, BestPicture2017, type="response")
BestPicture.predict4<-predict(BestPicture.win4, BestPicture2017, type="response")
BestPicture.predict5<-predict(BestPicture.win5, BestPicture2017, type="response")
BestPicture.predict6<-predict(BestPicture.win6, BestPicture2017, type="response")

BestPicture.predict
BestPicture.predict2
BestPicture.predict3
BestPicture.predict4
BestPicture.predict5
BestPicture.predict6


mycost <- function(r, pi = 0) { mean(abs(r-pi) > 0.5) }
loocv.error <- cv.glm(BestPictureHistory, BestPicture.win, K=4)
summary(loocv.error) 
loocv.error$delta



