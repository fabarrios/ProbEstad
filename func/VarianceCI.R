# Variance confidence interval
#
CI_sig <- function(x, alpha = 0.05) {
  sd_x <- sd(x)
  n_x <- length(x)
  lbs <- sqrt((n_x-1)*sd_x^2/qchisq((1-alpha/2), (n_x-1)))
  las <- sqrt((n_x-1)*sd_x^2/qchisq(alpha/2, (n_x-1)))
  print(c(lbs, las))
}

IAA <- c(9.7,12.3,11.2,5.1,24.8,14.8,17.7)
CI_sig(IAA, .05)
