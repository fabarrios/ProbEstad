#
# 
library(tidyverse)

HERS <- read_csv("https://raw.githubusercontent.com/fabarrios/Regression/master/DataRegressBook/Chap3/hersdata.csv", show_col_types = FALSE)
# Loading the HERS database in HERS variable
names(HERS)

HERS

summary(HERS)
