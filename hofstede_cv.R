
# Install.packages("tidyverse")
library(tidyverse)
library(ggthemes)
library(readxl)

# Read data
#cv <- read_excel("6-dimensions-for-website-2015-12-08-0-100.xls")
cv <- read_excel("6-dimensions-for-website-2015-12-08-0-100.xls", na = "#NULL!")
class(cv)

summary(cv)
head(cv)
mean(cv$idv, na.rm = TRUE)

# Visualize data
attach(cv)
plot(idv, pdi)

ggplot(data=cv, aes(x=idv, y=pdi)) +
  geom_point(size=5, col='red') +
  geom_smooth(method = lm) +
  theme_wsj()

library(ggrepel)
cv %>% 
  ggplot(aes(x=idv, y=pdi))+
  geom_point(size=3, color='red')+
  geom_smooth(method = lm) +
  geom_label_repel(aes(label=ctr))

# Simple Regression
lm <- lm(pdi ~ idv)
summary(lm)

## Correlations

# install.packages('GGally')
library(GGally)
ggpairs(cv, columns = c(4, 3, 5, 6, 7, 8), na='NA')

ggpairs(cv %>% select(idv, pdi, mas, uai, ltowvs, ivr))
ggcorr(cv %>% select(idv, pdi, mas, uai, ltowvs, ivr))

# Multiple Regression
mlm <- lm(ivr ~ idv + pdi + mas + uai + ltowvs)
mlm
summary(mlm)

