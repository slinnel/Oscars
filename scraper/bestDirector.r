#Author: Stephen Linnell
#Date 2-27-16
#This script runs generic linear models on the categories for the oscars

rm(list = ls())

##Begin Best Director Analysis
##Read in History Data
BestDirectorHistory = read.csv("/Users/SteverMac/Oscars/scraper/DataTables/pastdata/directordata.csv")
##read in the nominees for 2017
BestDirector2017 <- read.csv("/Users/SteverMac/Oscars/scraper/DataTables/2017/2017director.csv")

#generic linear model
BestDirector.win = glm(oscarwin ~noms + wins + globewin, family=binomial, data=BestDirectorHistory)
#predict on each nominee from 2017
BestDirector.predict<-predict(BestDirector.win, BestDirector2017, type="response")
BestDirector.predict
