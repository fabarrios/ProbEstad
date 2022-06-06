# How to handle a tibble example of the more used functions
# starting with a regular dataframe fron the R data
# changing to a tibble and the using functions.
library(tidyverse)
data("CO2") # This is a regular dataframe
CO2

CO2tib <- as_tibble(CO2)
newCO2tib <- CO2tib %>% 
              select(1:3, 5) %>%
              filter(uptake > 16) %>%
              group_by(Plant) %>%
              summarize(meanUp = mean(uptake), sdUp = sd(uptake)) %>%
              mutate( CV = (sdUp/meanUp)*100 ) %>%
              arrange(CV)

# results in a tibble
dataCO2tib