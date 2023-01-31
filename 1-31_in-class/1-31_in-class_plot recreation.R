library("tidyverse")
setwd("C:/Users/samha/Documents/GitHub/d2m-2023-shared")
mmdata <- read_csv("datasets/MM Data.csv")
mmdata.long <- mmdata %>% pivot_longer(cols=c("Red", "Green", "Blue", "Orange",
                                              "Yellow", "Brown"), names_to = "Color", values_to = "Number")

#first plot
ggplot(data=mmdata.long, aes(x=Color, y=Number, fill=Color)) + geom_boxplot() +
  theme(text = element_text(size=8))

#second plot  
ggplot(data=mmdata.long, aes(x=Color, y=Number, fill=Color)) + geom_boxplot() +
  geom_jitter() + theme(text = element_text(size=8))

#third plot
ggplot(data=mmdata.long, aes(x=Color, y=Number, fill=Color)) + geom_boxplot() +
  geom_dotplot(binaxis="y", stackdir = "up", position = "dodge") + theme(text = element_text(size=8))
