

# First load the libraries
library(tidyverse)
library(brms)
library(tidybayes)
library(bayesplot)
library(posterior)
library(loo)
library(rstanarm)


# set the option to run parallel
options(mc.cores = parallel::detectCores())

# Constructing a 120 points data set. A linear normally distributed sales responding to
# advertising spend

set.seed(123)
n <- 120

 advertising_spend <- rnorm(n, mean = 15, sd = 4)
 sales <- 20 + 3.5 * advertising_spend + rnorm(n, mean = 0, sd = 8)
 df <- data.frame(
          advertising_spend = advertising_spend,
          sales = sales
          )

 head(df)
 summary(df)
 
 ggplot(df, aes(x = advertising_spend, y = sales)) +
   geom_point(alpha = 0.7) +
   geom_smooth(method = "lm", se = FALSE) +
   theme_minimal()
 
 # A linear model is estimated to estimate the value of the slope and intersetion
 
 lm_model <- lm(sales ~ advertising_spend, data = df)
 summary(lm_model)
 
 # To run a Bayes linear regression
 # First we need to define the priors
 
 priors <- c(
     prior(normal(0, 20), class = "Intercept"),
     prior(normal(0, 10), class = "b"),
     prior(student_t(3, 0, 10), class = "sigma")
     )
 
 priors
 
 # The Bayes model is estimated with brm
 bayes_model <- brm(
   formula = sales ~ advertising_spend,
   data = df,
   prior = priors,
   family = gaussian(),
   chains = 4,
   iter = 4000,
   warmup = 2000,
   seed = 123
   )
 
 summary(bayes_model)
 
 # Bow extract the draws
 
 draws <- as_draws_df(bayes_model)
 head(draws)
 
 mean(draws$b_advertising_spend > 0)
 plot(bayes_model)
 
 mcmc_areas(
     as.array(bayes_model),
     pars = c("b_Intercept", "b_advertising_spend", "sigma")
     )
 
 mcmc_trace(
     as.array(bayes_model),
     pars = c("b_Intercept", "b_advertising_spend", "sigma")
     )
 
 pp_check(bayes_model)
 pp_check(bayes_model, type = "dens_overlay")
 pp_check(bayes_model, type = "hist")
 pp_check(bayes_model, type = "scatter_avg")
 
 tidy_draws <- bayes_model %>%
   spread_draws(b_Intercept, b_advertising_spend, sigma)
 head(tidy_draws)
 
 tidy_draws %>%
   ggplot(aes(x = b_advertising_spend)) +
   geom_density(fill = "steelblue", alpha = 0.4) +
   theme_minimal()
 
 new_customers <- data.frame(
   advertising_spend = c(10, 15, 20, 25)
 )
 
 # The difference is important:
 #     predict() includes outcome uncertainty
 #     fitted() focuses on the expected mean response
 
 predict(bayes_model, newdata = new_customers)
 fitted(bayes_model, newdata = new_customers)
 conditional_effects(bayes_model)
 
 # Compare with loo
 loo_result <- loo(bayes_model)
 print(loo_result)
 
 # The same for the Daniel example of the Waist measurements for the 
 # deep model
 Waist <- read_csv("~/Dropbox/GitHub/ProbEstad/DataSets/ch09_all/EXA_C09_S03_01.csv", show_col_types = FALSE)
 Waist
 
 # Waist data plot
 ggplot(Waist, aes(x = X, y = Y)) +
   geom_point(alpha = 0.7) +
   geom_smooth(method = "lm", se = FALSE) +
   theme_minimal()
 
 # to compare the fitted model with the lm model
 Waist_lm_model <- lm(Y ~ X, data = Waist)
 summary(Waist_lm_model)
 
 # priors definition 
 Waist_priors <- c(
   prior(normal(0, 50), class = "Intercept"),
   prior(normal(0, 10), class = "b"),
   prior(student_t(3, 0, 10), class = "sigma")
   )
 
 # Bayes model estimation
 Waist_bayes_model <- brm(
   formula = Y ~ X,
   data = Waist,
   prior = Waist_priors,
   family = gaussian(),
   chains = 4,
   iter = 4000,
   warmup = 2000,
   seed = 123
   )
 
 summary(Waist_bayes_model)
 Waist_draws <- as_draws_df(Waist_bayes_model)
 head(Waist_draws)
 
 plot(Waist_bayes_model)
 mcmc_areas(
   as.array(Waist_bayes_model),
   pars = c("b_Intercept", "b_X", "sigma")
   )
 mcmc_trace(
   as.array(Waist_bayes_model),
   pars = c("b_Intercept", "b_X", "sigma")
   )
 
 # checking the model
 pp_check(Waist_bayes_model, type = "dens_overlay")
 pp_check(Waist_bayes_model, type = "hist")
 pp_check(Waist_bayes_model, type = "scatter_avg")
 
 # the draws from the model estimations
 Waist_tidy_draws <- Waist_bayes_model %>%
   spread_draws(b_Intercept, b_X, sigma)
 head(Waist_tidy_draws)
 
 Waist_tidy_draws %>%
   ggplot(aes(x = b_X)) +
   geom_density(fill = "orange", alpha = 0.4) +
   theme_minimal()
 
 # New data to estimate forward fitting
 new_subjects <- data.frame(
   X = c(70, 75, 80, 90, 100)
 )
 predict(Waist_bayes_model, newdata = new_subjects)
 fitted(Waist_bayes_model, newdata = new_subjects)
 