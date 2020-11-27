#install.packages("tidyverse")
library(tidyverse)

library(readxl)
cv <- read_excel("6-dimensions-for-website-2015-12-08-0-100.xls")
class(cv)

summary(cv)
head(cv)
mean(cv$idv, na.rm = TRUE)

attach(cv)
plot(idv, pdi)
ggplot(data=cv, aes(x=idv, y=pdi)) +
  geom_point(size=5, col='red') +
  geom_smooth(method = lm)

lm <- lm(pdi ~ idv)
summary(lm)

# install.packages('GGally')
library(GGally)
ggpairs(cv, columns = c(4, 3, 5, 6, 7, 8))
help("ggpairs")

ggpairs(cv %>% select(idv, pdi, mas, uai, ltowvs, ivr))
ggcorr(cv %>% select(idv, pdi, mas, uai, ltowvs, ivr))

mlm <- lm(idv ~ pdi + mas + uai + ltowvs + ivr)
mlm
summary(mlm)
help(lm)
