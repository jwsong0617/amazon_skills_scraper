# initializing
library(dplyr)
library(ggplot2)
setwd("./Documents/GitHub/amazon_skills_scraper")

#read dataset
#liwc data
reviews_liwc = read.csv(file='datasets/LIWC2015 Results (reviews_processed_v01.csv).csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE)

#preprocess
#colnames
#A - author B - commentNum C - content D - date E - id F - rating G - skill_title H - timestamp I - title J - vote
review_colnames_vec = reviews_liwc %>% colnames()
review_colnames_vec[1:10] = c("author", "commentNum", "content", "date", "id", "rating", "skill_title", "timestamp", "title", "vote")
colnames(reviews_liwc) = review_colnames_vec

#add category
skills = read.csv(file='datasets/skills_processed_v01.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8")
reviews = read.csv(file='datasets/reviews_processed_v01.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8")
t1 = reviews_liwc$skill_title %>% data.frame
t2 = cbind(skills$category,skills$title)
colnames(t1) = c('title')
colnames(t2) = c('category','title')
title_category = merge(t1,t2,by = 'title', all = TRUE)
reviews_liwc = reviews_liwc[order(reviews_liwc$skill_title),]
reviews_liwc = mutate(reviews_liwc, title_category$category)
colnames(reviews_liwc)[104] = 'category'

#EDA
reviews_liwc %>% head
attach(reviews_liwc)
colnames(reviews_liwc)
head(reviews_liwc)
summary(reviews_liwc)
str(reviews_liwc)
temp = filter(.data = reviews_liwc, skill_title == 'The Magic Door')
temp$shehe %>% summary
detach(reviews_liwc)

# plotting
# boxplot
ggplot(data = reviews_liwc, aes(x = skill_title ,y = social)) + geom_boxplot()
ggplot(data = reviews_liwc, aes(x = skill_title ,y = shehe)) + geom_boxplot() #no
ggplot(data = reviews_liwc, aes(x = skill_title ,y = they)) + geom_boxplot() #no
ggplot(data = reviews_liwc, aes(x = skill_title ,y = posemo)) + geom_boxplot()
ggplot(data = reviews_liwc, aes(x = skill_title ,y = negemo)) + geom_boxplot() #no
ggplot(data = reviews_liwc, aes(x = skill_title ,y = percept)) + geom_boxplot()
ggplot(data = reviews_liwc, aes(x = skill_title ,y = affiliation)) + geom_boxplot()

#per category
ggplot(data = reviews_liwc, aes(x = category ,y = social)) + geom_boxplot()
ggplot(data = reviews_liwc, aes(x = category ,y = shehe)) + geom_boxplot() #no
ggplot(data = reviews_liwc, aes(x = category ,y = they)) + geom_boxplot() #no
ggplot(data = reviews_liwc, aes(x = category ,y = posemo)) + geom_boxplot()
ggplot(data = reviews_liwc, aes(x = category ,y = negemo)) + geom_boxplot() #no
ggplot(data = reviews_liwc, aes(x = category ,y = percept)) + geom_boxplot()
ggplot(data = reviews_liwc, aes(x = category ,y = affiliation)) + geom_boxplot()

# barplot
# social
# mean
social_mean = group_by(.data = reviews_liwc, skill_title) %>% summarise(mean = mean(social)) %>% data.frame
ggplot(social_mean, aes(x=skill_title, y = mean)) + geom_bar(stat = "identity") #mean, each skill

# shehe
# mean
shehe_mean = group_by(.data = reviews_liwc, skill_title) %>% summarise(mean = mean(shehe)) %>% data.frame
ggplot(shehe_mean, aes(x=skill_title, y = mean)) + geom_bar(stat = "identity") #mean, each skill
ggplot(reviews_liwc, aes(x=skill_title, y = shehe)) + geom_bar(stat = "identity")
