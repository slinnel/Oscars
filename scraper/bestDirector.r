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
BestDirector.win1 = glm(oscarwin ~noms + wins + globewin, family=binomial, data=BestDirectorHistory)
BestDirector.win2 = glm(oscarwin ~noms + wins, family=binomial, data=BestDirectorHistory)
BestDirector.win3 = glm(oscarwin ~noms + globewin, family=binomial, data=BestDirectorHistory)
BestDirector.win4 = glm(oscarwin ~wins + globewin, family=binomial, data=BestDirectorHistory)

#predict on each nominee from 2017
BestDirector.predict1<-predict(BestDirector.win1, BestDirector2017, type="response")
BestDirector.predict2<-predict(BestDirector.win2, BestDirector2017, type="response")
BestDirector.predict3<-predict(BestDirector.win3, BestDirector2017, type="response")
BestDirector.predict4<-predict(BestDirector.win4, BestDirector2017, type="response")

BestDirector.predict1
BestDirector.predict2
BestDirector.predict3
BestDirector.predict4
