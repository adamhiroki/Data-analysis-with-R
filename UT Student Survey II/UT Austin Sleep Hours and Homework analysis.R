#We would like to know if student at UT spend more time on homework per week
#in college than they did in high school?
# and do students in fraternities and sororities get less sleep on the weekends
#than other colleges

library(SDSFoundations)
post <- PostSurvey

Question 1
# Make a vector of difference scores
post$diff_hw <- post$hw_hours_college - post$hw_hours_HS

# Check the normality assumption
hist(post$diff_hw, xlab= 'Difference in time spend working on homework', main = 'hw_college-hw_hs')

# Run dependent t-test
t.test(post$hw_hours_HS, post$hw_hours_college, paired=T)

Question 2
# Make a vector of sleep scores for each sample
greek_sleep <- post$sleep_Sat[post$greek == "yes"]
non_greek_sleep <- post$sleep_Sat[post$greek == "no"]

# Check the normality assumption
hist(greek_sleep, xlab='Greek Member Sleep hours on weekend', main='Sleep Hours on Weekend')
hist(non_greek_sleep, xlab='Non-Greek Member Sleep hours on weekend', main='Sleep Hours on Weekend')

# Run independent t-test
t.test(greek_sleep, non_greek_sleep)

#From our analysis, we found out that the average amount of difference
#in the time that UT students spend on homework in High School vs college
#was found to be approximately normal
#The difference showed that, in college, students spend 10.95 hours more 
# on homework per week than in high school.
#This difference is significant(t(213)=16.81,p<0.05)
#For the second question, the distribution for sleepin greek participants and other students
#are both approximately normal
#There was not a significant difference between in amount of hours slept on a Saturday
#for students who are involved in Greek(means = 7.73) or vice versa(means = 8.04)
#With a t-statistic of -0.981(df=62.95 and p-value of 0.1137)