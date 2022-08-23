# R for Health Examples Ch3
# Copy of some examples for the Harrison & Pius book
# Taken from their book site.
library(tidyverse)
library(scales)

gbd_full <- read_csv("~/Dropbox/GitHub/ProbEstad/RforHealthData/global_burden_disease_cause-year-sex-income.csv", show_col_types = FALSE)

# Now we will work with the 2017 data
# Creating a single-year tibble for printing and simple examples:
gbd2017 <- gbd_full %>% 
  filter(year == 2017)

gbd2017 %>% 
  mutate(income = fct_relevel(income,
                              "Low",
                              "Lower-Middle",
                              "Upper-Middle",
                              "High")) %>% 
  # defining the variables using ggplot(aes(...)):
  ggplot(aes(x = sex, y = deaths_millions, fill = cause)) +
  # type of geom to be used: column (that's a type of barplot):
  geom_col(position = "dodge") +
  # facets for the income groups:
  facet_wrap(~income, ncol = 4) +
  # move the legend to the top of the plot (default is "right"):
  theme(legend.position = "top")

# summarise example
gbd2017$deaths_millions %>% sum()

gbd2017 %>% 
  summarise(sum(deaths_millions))

# Grouping by factor
gbd2017 %>% 
  group_by(cause) %>% 
  summarise(sum(deaths_millions))

# Possible to group by multiple factors
gbd2017 %>% 
  group_by(cause, sex) %>% 
  summarise(sum(deaths_millions))

# mutate() used to add collumns 
gbd2017 %>% 
  group_by(cause, sex) %>% 
  summarise(deaths_per_group = sum(deaths_millions)) %>% 
  ungroup() %>% 
  mutate(deaths_total = sum(deaths_per_group))

# if it is not listed it is saved 

gbd2017_summarised <- gbd2017 %>% 
  group_by(cause, sex) %>% 
  summarise(deaths_per_group = sum(deaths_millions)) %>% 
  ungroup() %>% 
  mutate(deaths_total    = sum(deaths_per_group),
         deaths_relative = percent(deaths_per_group/deaths_total))

gbd2017_summarised

gbd2017_summarised %>% 
  mutate(deaths_relative = deaths_per_group/deaths_total)