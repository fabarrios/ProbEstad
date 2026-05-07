# Solution for RevC13_25, Endurance fo the COPD patients

Rev13.25 <- read_csv(file="~/Dropbox/GitHub/ProbEstad/DataSets/ch13_all/REV_C13_25.csv", show_col_types = FALSE)
Rev13.25

Rev13.25_diff <- Rev13.25 %>%
  mutate( Diff_week = week10 - week0)
Rev13.25_diff <- Rev13.25_diff %>%
  mutate(GROUP = factor(GROUP))

# to order and adding a pair ID column
COPD <- Rev13.25 %>%
  mutate(PAIR =c(1:20))

# Data collected were the Endurance times in seconds. for two traings TF-IMT
COPD_long <- COPD %>%
  pivot_longer(cols = c("week0", "week10") , names_to = "IMT", values_to = "Endurance")

# now making factors
COPD_long <- COPD_long %>%
  mutate( PAIR = factor(PAIR), GROUP = factor(GROUP), IMT = factor(IMT))

ggplot(data = COPD_long, aes(x = IMT, y = Endurance, fill = GROUP)) + 
  geom_boxplot(position = position_dodge(width = 0.6), alpha = 0.5) + 
  geom_jitter(position = position_jitterdodge(jitter.width = 0.15, dodge.width = 0.6), aes(color = GROUP), alpha = 0.8, size = 1.4) + 
  labs(x = "Treatment", y = "Endurance", fill = "Group") + theme_bw()

Endurance_plot <- ggboxplot(
  COPD_long, x = "IMT", y = "Endurance", add = "jitter", color = "GROUP",
  ylab = "Endurance", xlab = "Treatment" )
Endurance_plot

# The paired Wilcox test
Rev13.25_diff.test <- Rev13.25_diff  %>%
  wilcox_test(Diff_week ~ GROUP, paired = TRUE) %>%
  add_significance()
Rev13.25_diff.test

Rev13.25_diff  %>%
wilcox_effsize(Diff_week ~ GROUP, paired = TRUE)

COPD_long_aov <- anova_test(data = COPD_long, dv = Endurance, wid = PAIR,
                            between = GROUP, within = IMT)
get_anova_table(COPD_long_aov)