#Author: Stephen Linnell
#Date 2-27-16
#This script runs generic linear models on the categories for the oscars

rm(list = ls())

##Begin Best Actress Analysis
##Read in History Data
BestActressHistory = read.csv("/Users/SteverMac/Oscars/scraper/DataTables/pastdata/sfadata.csv")
##read in the nominees for 2017
BestActress2017 <- read.csv("/Users/SteverMac/Oscars/scraper/DataTables/2017/2017supportactress.csv")

#generic linear model
BestActress.win1 = glm(oscarwin ~noms + wins + globewin, family=binomial, data=BestActressHistory)
BestActress.win2 = glm(oscarwin ~noms + wins, family=binomial, data=BestActressHistory)
BestActress.win3 = glm(oscarwin ~noms + globewin, family=binomial, data=BestActressHistory)
BestActress.win4 = glm(oscarwin ~wins + globewin, family=binomial, data=BestActressHistory)

#predict on each nominee from 2017
BestActress1.predict<-predict(BestActress.win1, BestActress2017, type="response")
BestActress2.predict<-predict(BestActress.win2, BestActress2017, type="response")
BestActress3.predict<-predict(BestActress.win3, BestActress2017, type="response")
BestActress4.predict<-predict(BestActress.win4, BestActress2017, type="response")

BestActress1.predict
BestActress2.predict
BestActress3.predict
BestActress4.predict

BestActress2017

9.999908e-01
3.108233e-06 
3.108233e-06 
2.527141e-04 
3.108233e-06
