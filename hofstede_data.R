install.packages("tidyverse")
library(tidyverse)

library(readxl)
cv <- read_excel("6-dimensions-for-website-2015-12-08-0-100.xls")
cv <- as_tibble(cv)
summary(cv, na.rm = TRUE)
mean(cv$idv, na.rm = TRUE)
attach(cv)

head(cv)
plot(idv, pdi)

install.packages("GGally")
library(GGally)
ggpairs(cv, columns = 3:8)
help("ggpairs")
ggpairs(cv %>% select(idv, pdi, mas, uai, ltowvs, ivr))
ggcorr(cv %>% select(idv, pdi, mas, uai, ltowvs, ivr))
