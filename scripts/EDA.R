library(dplyr)
library(ggplot2)
setwd("./Documents/GitHub/amazon_skills_scraper")

#read dataset
skills = read.csv(file='datasets/skills_processed_v01.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8")
reviews = read.csv(file='datasets/reviews_processed_v01.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8")
comments = read.csv(file='datasets/comments_processed_v01.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8")

#preprocess
skills$reviewNum = gsub(',', '', x = skills$reviewNum)
skills$reviewNum = skills$reviewNum %>% as.numeric()

#EDA
skills %>% head
summary(skills)
str(skills)
arrange(skills, desc(rating))%>%  select(title, rating)
skills$title

#plotting

#boxplot
skills %>% ggplot(aes(x=title, y = rating)) + geom_boxplot()

#barplot
skills %>% ggplot(aes(x = reorder(title, -rating), y = rating)) + geom_bar(stat = "identity")
skills %>% ggplot(aes(x = reorder(title, -reviewNum), y = reviewNum)) + geom_bar(stat = "identity")

temp = select(skills, title, reviewNum)
temp$reviewNum = scale(temp$reviewNum)
temp2 = select(skills, title, rating)
temp2$rating = scale(temp2$rating)
ggplot(data = skills, aes(x = reorder(title, -rating), y = rating)) + geom_bar(stat = "identity", fill = "green", color = "blue")
ggplot(data = temp2, aes(x = reorder(title, -rating), y = rating)) + geom_bar(stat = "identity", fill = "blue", color = "blue") +
 geom_line(data = temp, aes(x = reorder(title, reviewNum), y = reviewNum, group = 1), stat = "identity", color = "red") + # rating & reviewNum
  labs(title = "Rating = Bar, reviewNum = Point", x= "Title", y = "Rating") +
    theme(plot.title = element_text(hjust = 0.5))
ggplot() + geom_bar(data = skills, aes(x = reorder(title, -reviewNum), y = reviewNum), stat = "identity")

