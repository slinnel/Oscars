#Author: Stephen Linnell
#Date 2-27-16
#This script runs generic linear models on the categories for the oscars

rm(list = ls())

##Begin Best Actor Analysis
##Read in History Data
BestActorHistory = read.csv("/Users/SteverMac/Oscars/scraper/DataTables/pastdata/actordata.csv")
##read in the nominees for 2017
BestActor2017 <- read.csv("/Users/SteverMac/Oscars/scraper/DataTables/2017/2017actor.csv")
BestActor2017
#generic linear model
BestActor.win1 = glm(oscarwin ~ noms + wins + globewin, family=binomial, data=BestActorHistory)
BestActor.win2 = glm(oscarwin ~ noms + wins,family=binomial, data=BestActorHistory)
BestActor.win3 = glm(oscarwin ~wins + globewin, family=binomial, data=BestActorHistory)
BestActor.win4 = glm(oscarwin ~ noms + globewin, family=binomial, data=BestActorHistory)


#predict on each nominee from 2017

BestActor.predict1<-predict(BestActor.win1, BestActor2017, type="response")
BestActor.predict2<-predict(BestActor.win2, BestActor2017, type="response")
BestActor.predict3<-predict(BestActor.win3, BestActor2017, type="response")
BestActor.predict4<-predict(BestActor.win4, BestActor2017, type="response")

BestActor.predict1
BestActor.predict2
BestActor.predict3
BestActor.predict4
