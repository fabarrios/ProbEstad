# Problem 4.2.1 Daniel
# example of Co-occurring Addictive Substances by patients addicted to Gambling (CASG)"
# data taken from table 4.2.4 ch4 Daniel.

freq_casg <- c(144, 342, 142, 72, 39, 20, 6, 9, 2, 1)
total_freq_casg <- sum(freq_casg)
prob_casg <- freq_casg/total_freq_casg
cu_prob_casg <- cumsum(prob_casg)

# Frequency of the CASG variable graph
plot(freq_casg, ylab= "Frequency of CASG", pch =19)
barplot(freq_casg, ylab= "Frequency of CASG", col = 6)

# cumulative probability graph
plot(1:10, cu_prob_casg,
     +      type = "s",                    # step function
     +      xlab = "x",
     +      ylab = "Cumulative probability",
     +      main = "Co-occurring Addictive Substances in Gambling (CASG)",
     +      ylim = c(0, 1))
# points(1:10, cu_prob_casg, pch = 16)