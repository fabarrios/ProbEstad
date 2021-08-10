# Problems with LDS Daniel
# Examples Chp_6 2 and 3 LDS
setwd("~/Dropbox/GitHub/ProbEstad2021")
library(tidyverse)
# To set the working directory realtive to the user's dir
# and useful libraries

# sample mean confidence inteval (t)
MeanEstim_CI <- function(x, alpha = .05) {
  mean_x <- mean(x)
  sd_x <- sd(x)
  n_x <- length(x)
  lv_mean <- mean_x - (qt((1-alpha/2), (n_x - 1))*sd_x/sqrt(n_x)) 
  uv_mean <- mean_x + (qt((1-alpha/2), (n_x - 1))*sd_x/sqrt(n_x))
  result <- c(lv_mean, uv_mean)
  return(result)
}

# sample variance CI function
VarEstim_CI <- function(x, alpha = .05) {
  var_x <- var(x)
  n_x <- length(x)
  lbs <- (n_x-1)*var_x/qchisq((1-alpha/2), (n_x-1))
  las <- (n_x-1)*var_x/qchisq(alpha/2, (n_x-1))
  result <- c(lbs, las)
  return(result)
}

LDS_cho <- read_csv("DataSets/ch06_all/LDS_C06_CHOLEST.csv")
hist(LDS_cho$CHOLEST)

Chol_samp15  <- sample(LDS_cho$CHOLEST, 15, replace = FALSE)
summary(Chol_samp15)
# variance 95 confidence interval for sample
Chol_samp15Var_CI <- VarEstim_CI(Chol_samp15, 0.05)
print(c("LowerLimit", "UpperLimit"))
print(Chol_samp15Var_CI)

Chol_225 <- (filter(LDS_cho, CHOLEST > 225))
hist(Chol_225$CHOLEST) # how the >225 distribution looks
Chol_225_samp <- sample(Chol_225$CHOLEST, 50, replace = FALSE)
summary(Chol_225_samp)

Chol_225_samp_mean <- MeanEstim_CI(Chol_225_samp)
print(c("LowerLimit", "UpperLimit"))
print(Chol_225_samp_mean)

Chol_225_samp_varCI <- VarEstim_CI(Chol_225_samp)
print(c("LowerLimit", "UpperLimit"))
print(Chol_225_samp_varCI) 