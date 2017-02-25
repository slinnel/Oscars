rm(list = ls())


BPnomData = read.csv("/Users/SteverMac/Oscars/scraper/bpdata.csv")

attach(BPnomData)
summary(BPnomData)

m.win = glm(oscarwin ~ noms, family = binomial)
summary(m.win)

plot(oscarwin ~ X.won)
pred.data <- data.frame(noms=c(1,2,3,4,5,6,7,8,9,10))
p = predict(m.win, pred.data, type="response")


