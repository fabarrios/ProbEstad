# Examen_03
# Hipótesis, Student t
library(tidyverse)
# # ------------------------------------------------------

# Problema 1
DH_age <- read_csv("~/Dropbox/GitHub/ProbEstad/DataSets/ch07_all/EXR_C07_S02_13.csv", show_col_types = FALSE)
DH_age

DH_age %>% ggplot(aes(x = '', y = Age)) +
  geom_boxplot() +
  geom_jitter(width = 0.02, alpha = 0.6, color = "red")
# pregunta si el promedio de esdad es menor a los 30 años.
# suponemos entonces H0 que la edad es mayor a los 30 años y la Ha es que es menor
t.test(DH_age, alternative = "less", mu = 30, paired = FALSE, conf.level = 0.95)

# este nivel de p nos permite tomar la hipótesis alternativa que acepta que el 
# promedio de edad es menor a los 30 años.

# Problema 2
# pacientes con PH tienen concentración de colesterol más alta que NT, al 95%
colest <- read_csv("~/Dropbox/GitHub/ProbEstad/DataSets/ch07_all/EXR_C07_S03_04.csv", show_col_types = FALSE)
colest

colest_new <- colest %>% 
  mutate( Group = case_when (
    Group == 1 ~ "PH",
    Group == 2 ~ "NT" ))

colest_new <- colest_new %>% mutate( Group = Group %>% fct_relevel("NT", "PH"))

# boxplot(Length ~ Group, data = colest_new)

colest_new %>% ggplot(aes(x = Group, y = Length)) +
  geom_boxplot() +
  geom_jitter(width = 0.02, alpha = 0.6, aes(color = Group))

t.test(Length ~ Group, paired = FALSE, alternative = "less", data = colest_new)

colest_new %>% t_test(Length ~ Group, p.adjust.method = "holm", paired = FALSE, alternative = "less")

# 3 
# volúmenes de orina (ml) iniciales seguidos de aquellos con consumo 
# de agua con glicerol
GEH <- read_csv("~/Dropbox/GitHub/ProbEstad/DataSets/ch07_all/REV_C07_41.csv", show_col_types = FALSE)

GEH_long <- GEH %>%
  pivot_longer(cols = c("Control", "Glycerol") , names_to = "Treatment", values_to = "Volume GEH")

GEH_long %>% ggplot(aes(x = Treatment, y = Volume_GEH)) +
  geom_boxplot() +
  geom_jitter(width = 0.03, alpha = 0.5, aes(color = Treatment))
# null hypotesis is that the Glycerol treatment results in larger or equal urine volume
# the p = 0.000 let us to conclude that the alternative hypotesis tell us that the Control
# results in larger urine volume, therefore there is more loss off water.
t.test(Volume_GEH ~ Treatment, paired = TRUE, alternative = "greater", data = GEH_long)

# 4 Usando dos líneas de retones, se midió niveles de glucosa en suero, después de 
# una experiencia traumática
LineA <- c(54, 99, 105, 46, 70, 87, 55, 58, 139, 91)
LineB <- c(93, 91, 93, 150, 80, 104, 128, 83, 88, 95, 94, 97)

var.test(LineA, LineB, ratio = 1, alternative = "two.sided", conf.level = .95)


Pacientes de enfermedades reumáticas u osteoporosis generalemtne sufren de pérdidas críticas 
de densidad mineral osea (Bone Mineral Density, BMD)