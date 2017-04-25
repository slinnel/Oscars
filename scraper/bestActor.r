#Author: Stephen Linnell
#Date 2-27-16
#This script runs generic linear models on the categories for the oscars

rm(list = ls())

##Begin Best Actor Analysis
##Read in History Data
BestActorHistory = read.csv("/Users/SteverMac/Oscars/scraper/DataTables/pastdata/actordata.csv")
##read in the nominees for 2017
BestActor2017 <- read.csv("/Users/SteverMac/Oscars/scraper/DataTables/2017/2017actor.csv")

#generic linear model
BestActor.win = glm(oscarwin ~ noms + wins + globewin, family=binomial, data=BestActorHistory)
#predict on each nominee from 2017
BestActor.predict<-predict(BestActor.win, BestActor2017, type="response")