# Exam01 LicTec
# 12-sep-2022
library(tidyverse)

NCBIRTH800 <- read_csv("~/Dropbox/GitHub/ProbEstad/DataSets/ch02_all/LDS_C02_NCBIRTH800.csv", show_col_types = FALSE)
NCBIRTH_sht <- NCBIRTH800 %>% select(mage, weeks, gained, tounces, tgrams)
summary(NCBIRTH_sht)

sd(NCBIRTH_sht$mage, na.rm = TRUE)
sd(NCBIRTH_sht$weeks, na.rm = TRUE)
sd(NCBIRTH_sht$gained, na.rm = TRUE)
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

NCBIRTH_sht %>% drop_na(mage) %>%
  ggplot(aes(x= "", y= mage, color = mage)) +
  geom_boxplot() +
  geom_jitter(alpha = 0.4, position = position_jitter(0.15)) +
  theme_bw()

NCBIRTH_sht %>% drop_na(gained) %>%
  ggplot(aes(x= "", y= gained, color = gained)) +
  geom_boxplot(color = 2) +
  geom_jitter(alpha = 0.4, position = position_jitter(0.15)) +
  theme_bw()

# layout(1)
# boxplot(tgrams ~ smoke, data = NCBIRTH800)
# boxplot(mage ~ marital, data = NCBIRTH800)
 
NCBIRTH800 %>% drop_na(smoke) %>%
  ggplot(aes(x= factor(smoke), y= tgrams, color= factor(smoke))) +
  geom_boxplot() +
  geom_jitter(alpha= 0.25, position = position_jitter(0.15)) +
  theme_bw()

NCBIRTH800 %>% drop_na(marital) %>%
  ggplot(aes(x= factor(marital), y= mage, color= factor(marital))) +
  geom_boxplot() +
  geom_jitter(alpha = 0.25, position = position_jitter(0.15)) +
  theme_bw()

# 2 Probabilidad
# Tabla de resultados de examen y preparatoria a la que se asistió
220/1000
# resp 0.22
500/1000
# resp 0.5
55/1000
# resp 0.055
55/500
# resp 0.11
390/1000 + 500/1000 - 300/1000
# resp 0.59
300/1000
# resp 0.3
390/1000
# resp 0.39
390/1000
# resp 0.39
65/390
# resp 0.1666667
390/1000 + 200/1000 - 70/1000
# resp 0.52
300/500
# resp 0.6