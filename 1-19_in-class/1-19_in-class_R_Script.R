library(tidyverse)
setwd("C:/Users/samha/Documents/GitHub/Optimality-Bias/1-19_pre_class")
optdata <- read.csv("1-19_pre_class_CLEANED DATASHEET.csv") %>% select(-1)

for (i in 1:9) {
  optdata[,i] <- sapply(optdata[,i], as.numeric)
}
for (i in 10:11) {
  optdata[,i] <- sapply(optdata[,i], as.character)
}

write.csv(optdata, "C:/Users/samha/Documents/GitHub/Optimality-Bias/1-19_in-class_CLEANED DATASHEET.csv")

#NOTE: I AM PURPOSELY NOT WRITING OUT THESE PARTS BECAUSE IT'S JUST FOR PRACTICE
which(optdata$isl_pkc != 9.00 & optdata$isl_pkc != 1.00)
