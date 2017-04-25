#Author: Stephen Linnell
#Date 2-27-16
#This script runs generic linear models on the categories for the oscars

rm(list = ls())

##Begin Best Actress Analysis
##Read in History Data
BestActressHistory = read.csv("/Users/SteverMac/Oscars/scraper/DataTables/pastdata/actressdata.csv")
##read in the nominees for 2017
BestActress2017 <- read.csv("/Users/SteverMac/Oscars/scraper/DataTables/2017/2017actress.csv")

#generic linear model
BestActress.win = glm(oscarwin ~noms + wins + globewin, family=binomial, data=BestActressHistory)
#predict on each nominee from 2017
BestActress.predict<-predict(BestActress.win, BestActress2017, type="response")
