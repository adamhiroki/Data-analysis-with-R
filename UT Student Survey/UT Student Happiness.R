#We want to figure out the percentage of the time are college students happy?
#How does our estimate of the true mean change as sample increases?

library(SDSFoundations)
survey <- StudentSurvey

# Calculate the population parameters
hist(survey$happy)
fivenum(survey$happy)
mean(survey$happy)
sd(survey$happy)

# Draw 1,000 samples of n=5 and find the mean of each sample.
xbar5 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$happy, size =5)
xbar5[i] <-  mean(x)}

# Graph the histogram of 1,000 sample means.
hist(xbar5,xlim=c(2,10))

# Calculate the mean and sd of the sampling distribution.
mean(xbar5)
sd(xbar5)

# Compare to the std dev predicted by the CLT.
sd(survey$happy)/sqrt(5)

#Repeat for samples of size n=15
xbar15 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$happy, size =15)
xbar15[i] <- mean(x)}
hist(xbar15,xlim=c(2,10))
mean(xbar15)
sd(xbar15)
sd(survey$happy)/sqrt(15)

#Repeat for samples of size n=25
xbar25 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$happy, size =25)
xbar25[i] <- mean(x)}
hist(xbar25,xlim=c(2,10))
mean(xbar25)
sd(xbar25)
sd(survey$happy)/sqrt(25)

#This analysis showcase that the population mean was 78.03%
#and the SD was 16.31%. The happiness scores were negatively skewed,
#Our simulation is consistent with the Central Limit Theorem,
#As we increased the size of our sample from 5 to 25,
#the sample means becomes less variable and tended to cluster
#more tightly around the true mean.