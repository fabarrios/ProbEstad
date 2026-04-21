# loading the libraries
library(tidyverse)

#loading the data
weights_data <- read_csv(file="~/Dropbox/GitHub/ProbEstad/CrawleyBookData/growth.csv", show_col_types = FALSE)

weights_data

# factoring data
weights_factor <- weights_data %>% 
  mutate(Sens = factor(supplement), Treat = factor(diet))

weights_factor <- weights_factor %>% 
  mutate(supplement = supplement %>% fct_relevel("control", "agrimore", "supergain", "supersupp"))

# Boxplot of the two factors one factor to color the data (diet)
ggplot(data = weights_factor, aes(x = supplement, y = gain, fill = diet)) +
  geom_boxplot(position = position_dodge(width = 0.6), alpha = 0.5) +
  geom_jitter(position = position_jitterdodge(jitter.width = 0.15, dodge.width = 0.6), aes(color = diet), alpha = 0.8, size = 1.4) +
  labs(x = "Supplement", y = "Response in weight gain", fill = "Diet") +
  theme_bw()

# for making a violin plot
ggplot(data = weights_factor, aes(x = supplement, y = gain, fill = diet)) +
  geom_violin(position = position_dodge(width = 0.6), trim = FALSE, alpha = 0.5) +
  geom_jitter(position = position_jitterdodge(jitter.width = 0.15, dodge.width = 0.6), aes(color = diet), alpha = 0.8, size = 1.4) +
  labs(x = "Supplement", y = "Response in weight gain", fill = "Diet") +
  theme_bw()

# ANOVA model with interactions gain ~ diet + supplement + diet:supplement
weights_model <- aov(gain ~ diet*supplement, data = weights_factor)
anova(weights_model)

# to see the effect sizes and work out the significance of the factors
S(weights_model)

# to estimate the significant differences
emmeans(weights_model, trt.vs.ctrl ~ diet + supplement)

weights_factor <- weights_factor %>%
  mutate(supplement_2 = supplement %>%
           fct_collapse(control_n = c("control", "supergain"),
                        best = c("supersupp", "agrimore"))
  )

ggplot(data = weights_factor, aes(x = supplement_2, y = gain, fill = diet)) +
  geom_violin(position = position_dodge(width = 0.6), trim = FALSE, alpha = 0.5) +
  geom_jitter(position = position_jitterdodge(jitter.width = 0.15, dodge.width = 0.6), aes(color = diet), alpha = 0.8, size = 1.4) +
  labs(x = "Supplement", y = "Response in weight gain", fill = "Diet") +
  theme_bw()

# New reduced model for two factors with the collapsed secod supplement
weights_model01 <- lm(gain ~ diet + supplement, data = weights_factor)
weights_model02 <- lm(gain ~ diet + supplement_2, data = weights_factor)

anova(weights_model01, weights_model02)

summary(weights_model02)
emmeans(weights_model02, trt.vs.ctrl ~ diet + supplement_2)

