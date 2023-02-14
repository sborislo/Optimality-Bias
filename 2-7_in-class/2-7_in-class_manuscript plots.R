library(tidyverse)
setwd("C:/Users/samha/Documents/GitHub/Optimality-Bias/1-19_pre_class")
optdata <- read.csv("1-19_pre_class_CLEANED DATASHEET.csv") %>% select(-1)

for (i in 1:9) {
  optdata[,i] <- sapply(optdata[,i], as.numeric)
}
for (i in 10:11) {
  optdata[,i] <- sapply(optdata[,i], as.character)
}

##PLOT 1
optdata_rev <- subset(optdata, both_pkc<=6.5)
optdata_rev <- subset(optdata, both_exp>2.5)
optdata_rev <- rename(optdata_rev, Expert=expert)
ggplot(optdata_rev, aes(both_pkc, both_exp, color=Expert)) +
  guides(fill=guide_legend(title="Expert")) +
  geom_smooth(method=lm, se=FALSE, size=0.9) +
  geom_point() +
  xlab("Negligence") +
  ylab("Need for Explanation") +
  theme_bw() +
  theme(axis.title.x=element_text(size=9), axis.title.y=element_text(size=9)) +
  scale_color_manual(values=c("darkgreen", "gray40")) +
  ggtitle("Experts are Blamed More for Making Suboptimal Decisions") +
  theme(plot.title = element_text(hjust = 0.5, size=9))

##PLOT 2
summary <- optdata %>% 
  group_by(choice, expert) %>% 
  summarise(average_blame = mean(both_blc, na.rm = T),
            blame_sd = sd(both_blc, na.rm = T)/sqrt(nrow(optdata)), 
            blame_min = average_blame - blame_sd,
            blame_max = average_blame + blame_sd)

nicelimits <- function(x) {
  # x is the range of the data
  # get breaks under default breaks behaviour (breaks are not known in advance)
  breaks <- scales::extended_breaks()(x)
  # Take the difference between breaks (should be constant)
  width  <- diff(breaks)[1]
  # Do something like `floor()`, but with `width`-units
  start <- (x[1] %/% width) * width
  # Do something like `ceiling()`, but with `width`-units
  end <- (c(x[2] %/% width) + 1) * width
  c(start, end)
}

optdata$choice = as_factor(choice)
optdata$choice = factor(optdata$choice, labels = c("Optimal", "Suboptimal"))
optdata$expert = as_factor(expert)
optdata$expert = factor(optdata$expert, labels = c("Expert", "Non-expert"))

ggplot(optdata, aes(choice, both_blc, fill=as.factor(expert))) +
  geom_bar(stat="summary", position=position_dodge(.9)) + 
  scale_y_continuous(breaks=c(1:7), labels=c("1","2","3","4","5","6","7"), limits = nicelimits, expand=c(0,0)) +
  xlab("Choice") +
  ylab("Blame") +
  guides(fill=guide_legend(title="Expert")) +
  theme_bw() +
  theme(axis.title.x=element_text(size=9), axis.title.y=element_text(size=9)) +
  ggtitle("Experts are Blamed More for Making Suboptimal Decisions") +
  scale_fill_manual(values=c("green4", "gray60")) +
  theme(plot.title = element_text(hjust = 0.5, size=9)) +
  geom_errorbar(data = summary, aes(x = choice, 
                                        y = average_blame,
                                        ymin = blame_min+(blame_max-blame_min), 
                                        max = blame_max-(blame_max-blame_min)),
                color = "black", size = .5, width = .1, position=position_dodge(0.9))

