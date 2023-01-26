library("tidyverse")
setwd("C:/Users/samha/Documents/GitHub/d2m-2023-shared")
adultdata <- read_csv("datasets/adult.data.csv")
adultdata$capitalgain <- adultdata$`capital-gain`
adultdata$hoursperweek <- adultdata$`hours-per-week`

#histogram
ggplot(adultdata, aes(capitalgain)) + geom_histogram()

#density
ggplot(adultdata, aes(y=hoursperweek)) + geom_density()
