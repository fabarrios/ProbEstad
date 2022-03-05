# Ejemplos de graficación
# del Harrison

library(tidyverse)
library(gapminder)

# datos del Gapminder
gapdata2007 <- gapminder %>%
  filter(year == 2007)
gapdata <- gapminder

# gráficas de barras, columnas, histogramas y cajas
gapdata2007 %>%
  filter(country %in% c("United Kingdom", "France", "Germany")) %>%
  ggplot(aes(x = country, y = lifeExp)) +
  geom_col()

gapdata2007 %>%
  filter(country %in% c("United Kingdom", "France", "Germany")) %>%
  ggplot(aes(x = country, y = lifeExp)) +
  geom_col() +
  coord_cartesian(ylim = c(76, 82))

# para entender el número de países en continente que es lo que va a dar
# la altura de la barra.
gapdata2007 %>%
  count(continent)

gapdata2007 %>%
  ggplot(aes(x = continent)) +
  geom_bar()

gapdata2007 %>%
  ggplot(aes(x = lifeExp)) +
  geom_histogram(binwidth = 10)

gapdata2007 %>%
  ggplot(aes(x = continent, y = lifeExp)) +
  geom_boxplot() +
  geom_point()

gapdata2007 %>%
  ggplot(aes(x = continent, y = lifeExp, color = continent)) +
  geom_boxplot()

gapdata2007 %>%
  ggplot(aes(x = continent, y = lifeExp)) +
  geom_boxplot() +
  geom_jitter(aes(color = continent))

# Primero se generan los datos para identificar los máximos para la 
# gráfica de cajas
label_data <- gapdata2007 %>% 
  group_by(continent) %>% 
  filter(lifeExp == max(lifeExp)) %>% 
  select(country, continent, lifeExp)

gapdata2007 %>% 
  ggplot(aes(x = continent, y = lifeExp)) +
  geom_boxplot() +
  geom_jitter(aes(colour = continent)) +
  geom_label(data = label_data, aes(label = country))

gapdata2007 %>% 
  ggplot(aes(x = continent, y = lifeExp)) +
  geom_boxplot() +
  geom_jitter(aes(colour = continent)) +
  geom_text(data = label_data, aes(label = country))