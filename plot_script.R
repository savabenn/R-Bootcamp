#Author: Savannah Bennett
#MERS data and plot

read.csv('cases.csv')

install.packages('ggplot2')
library(ggplot2)
library(lubridate)
mers <- read.csv('cases.csv')
mers$onset2 <- ymd(mers$onset) 
mers$hospitalized2 <- ymd(mers$hospitalized)
day0 <- min(na.omit(mers$onset2))
mers$epi.day <- as.numeric(mers$onset2 - day0) 
ggplot(data=mers) + 
  geom_bar(mapping=aes(x=epi.day, fill=country), position="fill") + 
  labs(x='Epidemic day', y='Case count', title='Global count of MERS cases by date by date of symptom onset',
       caption="Data from: https://github.com/rambaut/MERS-Cases/blob/gh-pages/data/cases.csv")
