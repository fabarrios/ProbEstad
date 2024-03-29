#
# 
library(tidyverse)

HERS <- read_csv("https://raw.githubusercontent.com/fabarrios/Regression/master/DataRegressBook/Chap3/hersdata.csv", show_col_types = FALSE)
# Loading the HERS database in HERS variable
names(HERS)

HERS
summary(HERS)

HERS_01 <- HERS %>% select(BMI, diabetes, glucose)
HERS_01 <- HERS_01 %>% mutate(gluc_high = glucose > 126)
HERS_01 <- HERS_01 %>% mutate(gluc_pre = glucose >= 100 & glucose <= 126)
HERS_01 <- HERS_01 %>% mutate(gluc_norm = glucose < 100)

# Exam01 LicTec
# 12-sep-2022
NCBIRTH800 <- read_csv("~/Dropbox/GitHub/ProbEstad/DataSets/ch02_all/LDS_C02_NCBIRTH800.csv", show_col_types = FALSE)
NCBIRTH_sht <- NCBIRTH800 %>% select(mage, weeks, gained, tounces, tgrams)

summary(NCBIRTH_sht)
sd(NCBIRTH_sht$mage, na.rm = TRUE)
sd(NCBIRTH_sht$weeks, na.rm = TRUE)
sd(NCBIRTH_sht$tounces, na.rm = TRUE)
sd(NCBIRTH_sht$tgrams, na.rm = TRUE)

NCBIRTH_sht %>% ggplot(aes(x=mage)) +
  geom_histogram(binwidth = 4, color = 4) +
  geom_freqpoly(binwidth = 4, color = 2) +
  theme_bw()

NCBIRTH_sht %>% ggplot(aes(x=weeks)) +
  geom_histogram(binwidth = 2, color = 4) +
  geom_freqpoly(binwidth = 2, color =2 ) +
  theme_bw()

NCBIRTH_sht %>% ggplot(aes(x=gained)) +
  geom_histogram(binwidth = 2, color = 4) +
  geom_freqpoly(binwidth = 2, color =2 ) +
  theme_bw()

NCBIRTH_sht %>% ggplot(aes(x=tounces)) +
  geom_histogram(binwidth = 10, color = 4) +
  geom_freqpoly(binwidth = 10, color = 2) +
  theme_bw()

NCBIRTH_sht %>% ggplot(aes(x=tgrams)) +
  geom_histogram(binwidth = 300, color = 4) +
  geom_freqpoly(binwidth = 300, color = 2) +
  theme_bw()

layout(matrix(1:4, ncol = 2))
boxplot(NCBIRTH_sht$mage, col = 4)
boxplot(NCBIRTH_sht$weeks, col = 4)
boxplot(NCBIRTH_sht$gained, col = 4)
boxplot(NCBIRTH_sht$tgrams, col = 4)

NCBIRTH800 %>% drop_na(smoke) %>%
  ggplot(aes(x= factor(smoke), y= tgrams, color= factor(smoke))) +
  geom_boxplot() +
  geom_jitter(alpha= 0.25, position = position_jitter(0.15)) +
  theme_bw()

NCBIRTH800 %>% drop_na(marital) %>%
  ggplot(aes(x= factor(marital), y= mage, color= factor(marital))) +
  geom_boxplot() +
  geom_jitter(alpha= 0.25, position = position_jitter(0.15)) +
  theme_bw()
