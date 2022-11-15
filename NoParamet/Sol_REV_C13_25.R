# Reading the data
Rev13.25 <- read_csv(file="~/Dropbox/GitHub/ProbEstad/DataSets/ch13_all/REV_C13_25.csv", show_col_types = FALSE)

Rev13.25
# There are no subject identification, se add subject ID for each graoup (two of 20)
COPD <- Rev13.25 %>% mutate(Subject = 1:20)

# now we can "elongate" the data for time - weeks, leaving the group out.
COPD_long <- COPD %>% 
  pivot_longer(cols = c("week0", "week10"), names_to = "Time", values_to = "TF_IMT")
COPD_long

COPD_long %>%
  group_by(GROUP) %>%
  group_by(Time) %>%
  get_summary_stats(TF_IMT, type = "median_iqr")

COPD_long %>%
  group_by(GROUP) %>%
  get_summary_stats(TF_IMT, type = "median_iqr")

COPD_long_Grp1 <- COPD_long %>%
  filter(GROUP == 1)
ggboxplot(COPD_long_Grp1, x = "Time", y = "TF_IMT", add = "jitter" , fill = "Time")

COPD_long_Grp2 <- COPD_long %>%
  filter(GROUP == 2)
ggboxplot(COPD_long_Grp2, x = "Time", y = "TF_IMT", add = "jitter" , fill = "Time")

COPD_Friedman_test <- COPD_long %>%
  group_by(GROUP) %>%
  friedman_test(TF_IMT ~ Time | Subject)

COPD_long %>% friedman_effsize(TF_IMT ~ Time | Subject)

COPD_stat.test_EffSize <- COPD_long %>% 
  wilcox_test(TF_IMT ~ Time, paired = TRUE, p.adjust.method = "bonferroni")

# To test the baseline (the baseline must be equal for the different groups)
COPD_long_baseline <- COPD_long %>%
  filter(Time == "week0")
ggboxplot(COPD_long_baseline, x = "GROUP", y = "TF_IMT", add = "jitter" , fill = "GROUP")

COPD_baseline_test <- COPD_long_baseline  %>%
  wilcox_test(TF_IMT ~ GROUP, paired = TRUE, p.adjust.method = "holm", alternative = "two.sided") %>%
  add_significance()
COPD_baseline_test