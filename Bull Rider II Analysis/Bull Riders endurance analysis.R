#We want to know if professional bull riders stay on their bulls 50% of the time?
#Using mean ride % of 0.5 in 2014, and using riders with at least 5 events in 2014
#to test the hypothesis

library(SDSFoundations)
bull <- BullRiders

#Select bull riders from the US
USA <-bull[bull$Events14 > 4,]

# Summarize the bull rider weights
mean(USA$RidePer14)
sd(USA$RidePer14)

# Visualize the Percentage distribution
hist(USA$RidePer14, main='Histogram of US Bull Rider Percentage',xlab='Percentage (%)')

# Run the single sample t-test
t.test(USA$RidePer14, mu = 0.5)

#From this analysis, we found out that the distribution of time 
#a professional bull rider stays on the bull for this sample is approximately normal
#A mean of 33.5% and a SD of 10.7%.
#We also find that the mean rider % is significantly different from 50%
#with t = -10.05, p < 0.05.
#We are 95% confident that the true mean of ride % of professional bull riders
#is between 30.1% and 36.8%
#This suggests that professional bull riders ride the full 8 seconds
#1/3 of the time