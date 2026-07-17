# Solution for problem Rev_13_27
# Kinase activity correlated with arterial lactate acid

library(tidyverse)
library(rstatix)
library(ggpubr)

Rev13.27 <- read_csv(file="~/Dropbox/GitHub/ProbEstad/DataSets/ch13_all/REV_C13_27.csv", show_col_types = FALSE)
Rev13.27

PFK_act <- Rev13.27 %>%
  select("PFKC", "PFKCOPD")
PFK_act_long <- PFK_act %>%
  pivot_longer(cols = c("PFKC", "PFKCOPD"), names_to = "PFKinase", values_to = "Activity")
PFK_act_long <- PFK_act_long %>%
  mutate(PFKinase = factor(PFKinase))

HK_act <- Rev13.27 %>%
  select("HKC", "HKCOPD")
HK_act_long <- HK_act %>%
  pivot_longer(cols = c("HKC", "HKCOPD"), names_to = "HKinase", values_to = "Activity")
HK_act_long <- HK_act_long %>%
  mutate(HKinase = factor(HKinase))

LDH_act <- Rev13.27 %>%
  select("LDHC", "LDHCOPD")
LDH_act_long <- LDH_act %>%
  pivot_longer(cols = c("LDHC", "LDHCOPD"), names_to = "LDHkinase", values_to = "Activity")
LDH_act_long <- LDH_act_long %>%
  mutate(LDHkinase = factor(LDHkinase))

Act_kinase <- Rev13.27 %>% 
  pivot_longer(cols = c("PFKC", "PFKCOPD", "HKC", "HKCOPD", "LDHC", "LDHCOPD"), names_to = "Kinase", values_to = "Activity")

Act_kinase <- Act_kinase %>%
  mutate(Kinase = factor(Kinase))

ggplot(data = Act_kinase, aes(x = Kinase, y = Activity)) + 
  geom_boxplot(position = position_dodge(width = 0.6), alpha = 0.5) + 
  geom_jitter(position = position_jitterdodge(jitter.width = 0.15, dodge.width = 0.6), alpha = 0.8, size = 1.4) + 
  labs(x = "Kinase", y = "Activity") + theme_bw()

