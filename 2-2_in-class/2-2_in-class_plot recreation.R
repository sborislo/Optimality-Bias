library("tidyverse")
setwd("C:/Users/samha/Documents/GitHub/d2m-2023-shared")
mmdata <- read_csv("datasets/MM Data.csv")
mmdata.long <- mmdata %>% pivot_longer(cols=c("Red", "Green", "Blue", "Orange",
                                              "Yellow", "Brown"), names_to = "Color", values_to = "Number")

#first plot
ggplot(data=mmdata.long, aes(x=Color, y=Number, fill=Color, color=Color)) + geom_violin(trim = FALSE, alpha = 0.1) +
  geom_jitter(aes(color=Color)) + scale_fill_manual(values = alpha(c("blue", "brown", "green", "orange", "red", "yellow"))) + 
  scale_color_manual(values = c("blue", "brown", "green", "orange", "red", "yellow")) + theme_bw() + theme(text=element_text(size=8)) +
  theme(legend.title = element_blank())

#second plot  
mmdata.long$Color <- factor(mmdata.long$Color, levels=c("Red", "Orange", "Yellow", "Green", "Blue", "Brown"))
ggplot(data=mmdata.long, aes(x=Color, y=Number, fill=Color, color=Color)) + geom_violin(trim = FALSE, alpha = 0.1) +
  geom_jitter(aes(color=Color)) + scale_fill_manual(values = alpha(c("Red", "Orange", "Yellow", "Green", "Blue", "Brown"))) + 
  scale_color_manual(values = c("Red", "Orange", "Yellow", "Green", "Blue", "Brown")) + geom_boxplot(color="black", fill=alpha("white", 0), outlier.shape=NA) + theme_bw() + theme(text=element_text(size=8)) +
  theme(legend.title = element_blank())
