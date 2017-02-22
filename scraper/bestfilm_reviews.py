
# coding: utf-8

# In[26]:

from bs4 import BeautifulSoup
import urllib
import urllib2

#to print individual movies in individual years
#for i in criticsRated:
#    for j in i:
#        print(j)


#arrays that hold string arrays
globes=[]
oscars=[]
critics=[]
spirits=[]
baftas=[]
links=[]
criticsRated=[]

#critics choice script , only one that gets reviews currently

#2016 link is different than others on imdb
years = ["2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016-1"]
#years = ["2006"] to shorten time, with reviews it takes a VERY long time

#loops once for each year
for i in years: 
    url = 'http://www.imdb.com/event/ev0000133/'+ i
    page = urllib2.urlopen(url)
    soup = BeautifulSoup(page.read(), "html5lib")
    
#page contains all award data from the webpage, array of size 1 i think
    page = soup.findAll("div",{"class":"award"})
    
#awards is an array, different indexes are different catagories, different for each type of award
    awards = page[0].findAll("blockquote")
    
#index 0 is trash, 1 is where data starts, usually best picture
    film = awards[1].findAll("strong")
    
#arrays to hold current years data, to be appended to array of arrays later
    thisYear = []
    namesWithReviews=[]

#iterates through each nominee
    for i in film: 
        thisYear.append(i.a.text)
#gets movie url and scrapes the reviews
        movieUrl = "http://www.imdb.com"+ i.a['href']
        moviePage = urllib2.urlopen(movieUrl)
        soup2 = BeautifulSoup(moviePage.read(), "html5lib")
        imdbReview = soup2.find("span",{"itemprop":"ratingValue"})
        tempPage = soup2.find("div",{"class":"metacriticScore"})
        metaReview = tempPage.find("span")
        namesWithReviews.append(i.a.text + " , imdb: " + imdbReview.text + " , meta: " + metaReview.text)
        
    #for i in film: temp.append(i.a['href'])
        
    critics.append(thisYear)
    #links.append(temp)
    criticsRated.append(namesWithReviews)


# In[61]:

#acadamy awards
years = ["2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016"]
for i in years: 
    url = 'http://www.imdb.com/event/ev0000003/'+ i
    page = urllib2.urlopen(url)
    soup = BeautifulSoup(page.read(), "html5lib")
    page = soup.findAll("div",{"class":"award"})
    awards = page[0].findAll("blockquote")
    film = awards[1].findAll("strong")
    thisYear = []
    for i in film: thisYear.append(i.a.text)
    oscars.append(thisYear)


# In[62]:

years = ["2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017"]

#golden globes
for i in years: 
    url = 'http://www.imdb.com/event/ev0000292/'+ i
    page = urllib2.urlopen(url)
    soup = BeautifulSoup(page.read(), "html5lib")
    page = soup.findAll("div",{"class":"award"})
    awards = page[0].findAll("blockquote")
    film = awards[1].findAll("strong")
    thisYear = []
    for i in film: thisYear.append(i.a.text)
    globes.append(thisYear)


# In[63]:

#bafta
for i in years: 
    url = 'http://www.imdb.com/event/ev0000123/'+ i
    page = urllib2.urlopen(url)
    soup = BeautifulSoup(page.read(), "html5lib")
    page = soup.findAll("div",{"class":"award"})
    awards = page[0].findAll("blockquote")
    film = awards[1].findAll("strong")
    thisYear = []
    for i in film: thisYear.append(i.a.text)
    baftas.append(thisYear)


# In[64]:

#spirits
for i in years: 
    url = 'http://www.imdb.com/event/ev0000349/'+ i
    page = urllib2.urlopen(url)
    soup = BeautifulSoup(page.read(), "html5lib")
    page = soup.findAll("div",{"class":"award"})
    awards = page[0].findAll("blockquote")
    film = awards[1].findAll("strong")
    thisYear = []
    for i in film: thisYear.append(i.a.text)
    spirits.append(thisYear)


# In[ ]:




# In[27]:

for i in criticsRated:
    for j in i:
        print(j)

