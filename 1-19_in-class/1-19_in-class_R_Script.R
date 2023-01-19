library(tidyverse)
setwd("C:/Users/samha/Documents/GitHub/Optimality-Bias/1-19_pre_class")
optdata <- read.csv("1-19_pre_class_CLEANED DATASHEET.csv") %>% select(-1)

for (i in 1:9) {
  optdata[,i] <- sapply(optdata[,i], as.numeric)
}
for (i in 10:11) {
  optdata[,i] <- sapply(optdata[,i], as.character)
}

#change conditions to labels
optdata$choice = as_factor(choice)
optdata$choice = factor(optdata$choice, labels = c("Optimal", "Suboptimal"))
optdata$expert = as_factor(expert)
optdata$expert = factor(optdata$expert, labels = c("Expert", "Non-expert"))

write.csv(optdata, "C:/Users/samha/Documents/GitHub/Optimality-Bias/1-19_in-class_CLEANED DATASHEET.csv")

#NOTE: I AM PURPOSELY NOT WRITING OUT THESE PARTS BECAUSE IT'S JUST FOR PRACTICE
ggplot(optdata, aes(both_blc)) + geom_density() #graph key variable blame
#seems to have huge bump at 1...

optdata <- optdata %>% filter_at(vars(c(1:9)), all_vars(. != 9 & . != 1)) #exclude endpoints
ggplot(optdata, aes(both_blc)) + geom_density()
#now looks more normal/less skewed