
# coding: utf-8

# In[22]:

from bs4 import BeautifulSoup
import urllib
import urllib2
#awards1 = best film
#awards4 = best actor
#awards7 = best actress
#awards11 = director
#print(awards[1])
globes=[]
oscars=[]
critics=[]
spirits=[]
baftas=[]

#critics choice
years = ["2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016-1"]
for i in years: 
    url = 'http://www.imdb.com/event/ev0000133/'+ i
    page = urllib2.urlopen(url)
    soup = BeautifulSoup(page.read(), "html5lib")
    page = soup.findAll("div",{"class":"award"})
    awards = page[0].findAll("blockquote")
    
    thisYear = []
    actorsThisYear = []
    
    actors=awards[4].findAll("a")
    size=len(actors)
    indexes=[]
    index=1
    iterator=range(size)
    

#the way this data is kept is different slightly than best picture, needs indexes
    for i in iterator:  
        if(index<size):
            indexes.append(index)
        index=index+3
        
    for i in indexes: actorsThisYear.append(actors[i].text + " , " + actors[i+1].text) 
    thisYear.append(actorsThisYear)
    print(thisYear)

    


# In[ ]:

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


# In[ ]:

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


# In[ ]:

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


# In[8]:

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


# In[20]:

print(indexes)

