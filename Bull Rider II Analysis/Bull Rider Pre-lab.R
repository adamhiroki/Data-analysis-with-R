#We want to know if professional bull riders from the US weigh
#the same like average American adult man (190 lbs)

library(SDSFoundations)
bull <- BullRiders

#Select bull riders from the US
USA <-bull[bull$Country=="USA",]

# Summarize the bull rider weights
mean(USA$Weight)
sd(USA$Weight)

# Visualize the weight distribution
hist(USA$Weight, main='Histogram of US Bull Rider Weights',xlab='Weight (lbs)')

# Run the single sample t-test
t.test(USA$Weight, mu=190)

#From this analysis, we found out that the sample distribution 
#of professional bull riders is approximately Normal
#with mean of 153.11 lbs and a SD of 13.02lbs.
#We found that their mean weight is significantly different than 190lbs, 
#with t=-17.2, p < 0.05. We are 95% confident that 
#the true mean of professional bull riders is between 148.8lbs and 157.5lbs
# This suggests that professional bull riders weigh less than the average American male