library(tidyverse)
setwd("C:/Users/samha/Documents/GitHub/Optimality-Bias/1-19_in-class")
optdata <- read.csv("1-19_in-class_CLEANED DATASHEET.csv") %>% select(-1)

#I think my dataset is already fine, so here's some visualizations in prep
ggplot(optdata, aes(choice, both_blc)) + geom_bar(stat="identity")
ggplot(optdata, aes(expert, both_blc)) + geom_bar(stat="identity")
expertonly <- optdata %>% filter(expert=="Expert")
hist(expertonly$both_blc)
noviceonly <- optdata %>% filter(expert=="Non-expert")
hist(noviceonly$both_blc)
#seems that there is generally low blame, but the low blame is higher for
#experts. Also, the experts are blamed heavily more often. Might have to do
#a non-parametric test given the floor effect, but not sure if that's applicable

plot(expertonly$both_pkc, expertonly$both_exp)
cor.test(expertonly$both_pkc, expertonly$both_exp)
plot(noviceonly$both_pkc, noviceonly$both_exp)
cor.test(noviceonly$both_pkc, noviceonly$both_exp)
#this evidences that experts, when they make suboptimal decisions, are more so
#expected to give an explanation than non-experts who make suboptimal decisions.
#Suggests that there are greater expectations for experts.
