# Finding how many letterslong is the typical UT student's name? 
# and how does our estimate change as we increase the size of our sample?

library(SDSFoundations)
survey <- StudentSurvey

# Calculate the population parameters
hist(survey$name_letters)
fivenum(survey$name_letters)
mean(survey$name_letters)
sd(survey$name_letters)


# Draw 1,000 samples of n=5 and find the mean of each sample.
xbar5 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$name_letters, size =5)
xbar5[i] <-  mean(x)}


# Graph the histogram of 1,000 sample means.
hist(xbar5,xlim=c(2,10))


# Calculate the mean and sd of the sampling distribution.
mean(xbar5)
sd(xbar5)

# Compare to the std dev predicted by the CLT.
sd(survey$name_letters)/sqrt(5)


#Repeat for samples of size n=15
xbar15 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$name_letters, size =15)
xbar15[i] <- mean(x)}
hist(xbar15,xlim=c(2,10))
mean(xbar15)
sd(xbar15)
sd(survey$name_letters)/sqrt(15)


#Repeat for samples of size n=25
xbar25 <-rep(NA, 1000)
for (i in 1:1000)
{x <-sample(survey$name_letters, size =25)
xbar25[i] <- mean(x)}
hist(xbar25,xlim=c(2,10))
mean(xbar25)
sd(xbar25)
sd(survey$name_letters)/sqrt(25)


#This analysis showcase that the population mean was 5.97 letters
#and the SD was 1.49. The name lengths were normally distributed,
#Our simulation is consistent with the Central Limit Theorem,
#As we increased the size of our sample from 5 to 25,
#the sample means becomes less variable and tended to cluster
#more tightly around the true mean.