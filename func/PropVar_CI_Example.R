# Proportion of Variance for two populations confidence interval
# This small function estimates the confidence interval for the 
# proportion of the variances estimated form two samples
# 

PropVar_CI <- function(x, y, alpha = 0.05) {
  v_x <- var(x)
  n_x <- length(x)
  v_y <-var(y)
  n_y <- length(y)
  if (v_x > v_y) {
    pro_v <- v_x/v_y
    in_lim <- pro_v/qf((1-alpha/2), (n_x - 1), (n_y - 1))
    su_lim <- pro_v/qf((alpha/2), (n_x - 1), (n_y - 1))
  } else {
    pro_v <- v_y/v_x
    in_lim <- pro_v/qf((1-alpha/2), (n_y - 1), (n_x - 1))
    su_lim <- pro_v/qf((alpha/2), (n_y - 1), (n_x - 1))
  }
  result <- c(in_lim, su_lim)
  return(result)
}

com_am <- c(4.67, 10.5, 2.0, 3.18, 4.00, 3.5, 3.33, 5.32, 2.0, 4.25, 6.0)
inc_am <- c(3.0, 10.25, 1.5, 5.22, 5.0)

res <- PropVar_CI(com_am, inc_am, alpha = 0.95)
print(c("Límite inferior", "Límite superior"))
print(c(res))

