
library(ggplot2)


reviews = read.csv('reviews.csv')
listings = read.csv('listings.csv')
calendar = read.csv('calendar.csv')
neigh = read.csv('neighbourhoods.csv')

d <- calendar %>% group_by(price) %>% summarize(total_listings = n())
View(d)

ggplot(aes(price, total_listings), data=d) + geom_point() + ylim(0,1000) #shows that there is very little correlation
