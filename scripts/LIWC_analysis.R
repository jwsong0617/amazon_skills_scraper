# initializing
library(dplyr)
library(ggplot2)
setwd("./Documents/GitHub/amazon_skills_scraper")

#read dataset
#liwc data
reviews_liwc = read.csv(file='datasets/reviews_liwc.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE)

#EDA
reviews_liwc %>% head
reviews_liwc %>% colnames()
attach(reviews_liwc)
colnames(reviews_liwc)
head(reviews_liwc)
summary(reviews_liwc)
temp = filter(.data = reviews_liwc, Source..G. == 'The Magic Door')
temp$shehe %>% summary
detach(reviews_liwc)

# plotting
# boxplot
ggplot(data = reviews_liwc, aes(x = Source..G. ,y = social)) + geom_boxplot()
ggplot(data = reviews_liwc, aes(x = Source..G. ,y = shehe)) + geom_boxplot()
ggplot(data = reviews_liwc, aes(x = Source..G. ,y = they)) + geom_boxplot()
ggplot(data = reviews_liwc, aes(x = Source..G. ,y = posemo)) + geom_boxplot()
ggplot(data = reviews_liwc, aes(x = Source..G. ,y = negemo)) + geom_boxplot()
ggplot(data = reviews_liwc, aes(x = Source..G. ,y = they)) + geom_boxplot()
ggplot(data = reviews_liwc, aes(x = Source..G. ,y = percept)) + geom_boxplot()
ggplot(data = reviews_liwc, aes(x = Source..G. ,y = affiliation)) + geom_boxplot()

# barplot
# social
# mean
social_mean = group_by(.data = reviews_liwc, Source..G.) %>% summarise(mean = mean(social)) %>% data.frame
ggplot(social_mean, aes(x=Source..G., y = mean)) + geom_bar(stat = "identity") #mean, each skill

# shehe
# mean
shehe_mean = group_by(.data = reviews_liwc, Source..G.) %>% summarise(mean = mean(shehe)) %>% data.frame
ggplot(shehe_mean, aes(x=Source..G., y = mean)) + geom_bar(stat = "identity") #mean, each skill
ggplot(reviews_liwc, aes(x=Source..G., y = shehe)) + geom_bar(stat = "identity")
