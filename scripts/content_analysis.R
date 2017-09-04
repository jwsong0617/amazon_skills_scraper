library(dplyr)
library(ggplot2)
setwd("./Documents/GitHub/amazon_skills_scraper")

# capitalOne = capitalOne[-nrow(capitalOne),]
# capitalOne %>% head
# capitalOne[is.na(capitalOne)] <- 0
# capitalOne[21,]

#read dataset
capitalOne = read.csv(file='manual_data/content_analysis_skills/content_analysis_capitalOne.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8",skip = 2, na.strings = c(''))
workout = read.csv(file='manual_data/content_analysis_skills/content_analysis_7minuteWorkout.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8",skip = 2, na.strings = c(''))
anymote = read.csv(file='manual_data/content_analysis_skills/content_analysis_anymoteSmartRemote.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8",skip = 2, na.strings = c(''))
askmybuddy = read.csv(file='manual_data/content_analysis_skills/content_analysis_askMyBuddy.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8",skip = 2, na.strings = c(''))
domino = read.csv(file='manual_data/content_analysis_skills/content_analysis_domino.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8",skip = 2, na.strings = c(''))
fox = read.csv(file='manual_data/content_analysis_skills/content_analysis_foxNews.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8",skip = 2, na.strings = c(''))
hue = read.csv(file='manual_data/content_analysis_skills/content_analysis_Hue.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8",skip = 2, na.strings = c(''))
bluelink = read.csv(file='manual_data/content_analysis_skills/content_analysis_hyundaiBlueLink.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8",skip = 2, na.strings = c(''))
jeopardy = read.csv(file='manual_data/content_analysis_skills/content_analysis_jeopardy.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8",skip = 2, na.strings = c(''))
lyft = read.csv(file='manual_data/content_analysis_skills/content_analysis_Lyft.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8",skip = 2, na.strings = c(''))
mastermind = read.csv(file='manual_data/content_analysis_skills/content_analysis_mastermind.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8",skip = 2, na.strings = c(''))
meow = read.csv(file='manual_data/content_analysis_skills/content_analysis_meow.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8",skip = 2, na.strings = c(''))
ourGroceries = read.csv(file='manual_data/content_analysis_skills/content_analysis_ourGroceries.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8",skip = 2, na.strings = c(''))
bedtimestory = read.csv(file='manual_data/content_analysis_skills/content_analysis_shortBedtimeStory.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8",skip = 2, na.strings = c(''))
sleepSounds = read.csv(file='manual_data/content_analysis_skills/content_analysis_SleepandRelaxationsSounds.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8",skip = 2, na.strings = c(''))
bartender = read.csv(file='manual_data/content_analysis_skills/content_analysis_theBartender.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8",skip = 2, na.strings = c(''))
magicDoor = read.csv(file='manual_data/content_analysis_skills/content_analysis_theMagicDoor.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8",skip = 2, na.strings = c(''))
translated = read.csv(file='manual_data/content_analysis_skills/content_analysis_translated.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8",skip = 2, na.strings = c(''))
weather = read.csv(file='manual_data/content_analysis_skills/content_analysis_weather.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8",skip = 2, na.strings = c(''))
wheresMyPhone = read.csv(file='manual_data/content_analysis_skills/content_analysis_wheresMyPhone.csv',header = TRUE, sep = ',' ,stringsAsFactors = FALSE,encoding = "utf-8",skip = 2, na.strings = c('')) 
skills_list = list(capitalOne,workout,anymote,askmybuddy,domino,fox,hue,bluelink,jeopardy,lyft,mastermind,meow,ourGroceries,
                   bedtimestory,sleepSounds,bartender,magicDoor,translated,weather,wheresMyPhone)
#make skills df
skills_contents_df = data.frame()
for(i in 1:length(skills_list)){
  temp = skills_list[[i]]
  skills_contents_df = rbind(skills_contents_df,temp[21,])
}
skill_names = c('capitalOne','workout','anymote','askmybuddy','domino','fox','hue','bluelink','jeopardy','lyft','mastermind','meow','ourGroceries',
                'bedtimestory','sleepSounds','bartender','magicDoor','translated','weather','wheresMyPhone')
rownames(skills_contents_df) = seq(1:20)
# rownames(skills_contents_df) = c('capitalOne','workout','anymote','askmybuddy','domino','fox','hue','bluelink','jeopardy','lyft','mastermind','meow','ourGroceries','
#                                bedtimestory','sleepSounds','bartender','magicDoor','translated','weather','wheresMyPhone')
skills_contents_df = skills_contents_df[,-c(1,2)]
skills_contents_df = data.matrix(skills_contents_df) %>% data.frame
skills_contents_df = cbind(skill_names,skills_contents_df)

#EDA
skills_contents_df %>% str
skills_contents_df %>% summary
skills_contents_df[,-1] %>% boxplot()
skills_contents_df
# ggplot(skills_contents_df, aes(x=skill_names, y = colnames(skills_contents_df))) + geom_boxplot()
