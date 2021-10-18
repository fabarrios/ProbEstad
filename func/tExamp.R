library(tidyverse)

Cholesterol <- read_csv("DataSets/ch07_all/REV_C07_19.csv", show_col_types = FALSE)

Chol_long <- Cholesterol %>%
  pivot_longer(cols = c("Before", "After") , names_to = "Treat", values_to = "Chol")

boxplot(Chol ~ Treat , data = Chol_long, ylab = "Nivel de colesterol" )
t.test(Chol ~ Treat , data = Chol_long, alternative = "less", paired = TRUE, var.equal = TRUE, conf.level = 0.99)

# For factor instantiation with Before and After order
# For Before (1) and After (2) then factor 1 is greater than state 2! Factors compare respect the numerical order
Chol_long <- Chol_long %>% mutate( Treat = Treat %>% fct_relevel("Before", "After"))

boxplot(Chol ~ Treat , data = Chol_long, ylab = "Nivel de colesterol" )
t.test(Chol ~ Treat , data = Chol_long, alternative = "greater", paired = TRUE, var.equal = TRUE, conf.level = 0.99)