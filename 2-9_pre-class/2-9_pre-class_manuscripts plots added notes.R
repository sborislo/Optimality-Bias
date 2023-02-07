library(tidyverse)
setwd("C:/Users/samha/Documents/GitHub/Optimality-Bias/1-19_pre_class")
optdata <- read.csv("1-19_pre_class_CLEANED DATASHEET.csv") %>% select(-1) #load in dataset without weird first column

for (i in 1:9) { #convert continuous variables to numeric
  optdata[,i] <- sapply(optdata[,i], as.numeric)
}
for (i in 10:11) { #convert categorical variables to character
  optdata[,i] <- sapply(optdata[,i], as.character)
}

##PLOT 1
optdata_rev <- subset(optdata, both_pkc<=6.5) #exclude pkc outliers
optdata_rev <- subset(optdata, both_exp>2.5) #exclude exp outliers
optdata_rev <- rename(optdata_rev, Expert=expert) #fix expert label

#create point plot with least squares lines for each expert level
ggplot(optdata_rev, aes(both_pkc, both_exp, color=Expert)) + #color based on expert
  guides(fill=guide_legend(title="Expert")) + #legend
  geom_smooth(method=lm, se=FALSE, size=0.9) + #LSR lines
  geom_point() + #scatterplot
  xlab("Negligence") + #x label
  ylab("Need for Explanation") + #y label
  theme_bw() + #simple background
  theme(axis.title.x=element_text(size=9), axis.title.y=element_text(size=9)) + #make axis labels same size as title
  scale_color_manual(values=c("darkgreen", "gray40")) + #set group colors
  ggtitle("Experts are Blamed More for Making Suboptimal Decisions") + #title
  theme(plot.title = element_text(hjust = 0.5, size=9)) #make title fit and centered

##PLOT 2
summary <- optdata %>% #to be used for error bars
  group_by(choice, expert) %>% 
  summarise(average_blame = mean(both_blc, na.rm = T), #average blame
            blame_sd = sd(both_blc, na.rm = T)/sqrt(nrow(optdata)), #sd of blame
            blame_min = average_blame - blame_sd, #min blame
            blame_max = average_blame + blame_sd) #max blame

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

#label choice and expert
optdata$choice = as_factor(choice)
optdata$choice = factor(optdata$choice, labels = c("Optimal", "Suboptimal"))
optdata$expert = as_factor(expert)
optdata$expert = factor(optdata$expert, labels = c("Expert", "Non-expert"))

ggplot(optdata, aes(choice, both_blc, fill=expert)) + #color based on expert
  geom_bar(stat="summary", position=position_dodge(.9)) + #make bars not attached and take means
  scale_y_continuous(breaks=c(1:7), labels=c("1","2","3","4","5","6","7"), limits = nicelimits, expand=c(0,0)) + #label y-axis ticks and make spaced out nicely
  xlab("Choice") + #x label
  ylab("Blame") + #y label
  guides(fill=guide_legend(title="Expert")) + #legend
  theme_bw() + #simple background
  theme(axis.title.x=element_text(size=9), axis.title.y=element_text(size=9)) + #make x and y axis labels same size as title
  ggtitle("Experts are Blamed More for Making Suboptimal Decisions") + #title
  scale_fill_manual(values=c("green4", "gray60")) + #make bars by group certain colors
  theme(plot.title = element_text(hjust = 0.5, size=9)) + #make title fit and centered
  geom_errorbar(data = summary, aes(x = choice, #error bars (1 SE)
                                        y = average_blame,
                                        ymin = blame_min+(blame_max-blame_min), 
                                        max = blame_max-(blame_max-blame_min)),
                color = "black", size = .5, width = .1, position=position_dodge(0.9))
