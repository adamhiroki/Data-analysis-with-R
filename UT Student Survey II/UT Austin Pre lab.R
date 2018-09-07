#We would like to analyze who is happier at the beginning of the semester:
#under-classmen or upper-classmen in UT Austin?
#We would also like to know if student happiness change from the beginning of the semester to end?

library(SDSFoundations)
post <- PostSurvey

Question 1
# Make a vector of happiness scores for each sample
underclass_happy <- post$happy[post$classification=='Freshman'|post$classification=='Sophomore']
upperclass_happy <- post$happy[post$classification=='Junior'|post$classification=='Senior']

# Check the normality assumption
hist(underclass_happy, xlab='Underclassman Happiness', main='Percent of Time Happy')
hist(upperclass_happy, xlab='Upperclassman Happiness', main='Percent of Time Happy')

# Run independent t-test
t.test(underclass_happy, upperclass_happy)

Lab Question 2

# Make a vector of difference scores
post$diff_happy <- post$happy - post$post_happy

# Check the normality assumption
hist(post$diff_happy, xlab= 'Difference in Happiness over the Semester', main = 'Happy-Post Happy')

# Run dependent t-test
t.test(post$happy, post$post_happy, paired=T)

#From our analysis, we found out that the average happiness scores for 
#under-classmen and upper-classmenwere not found to be significantly 
#different (t=0.423, p=0.675). The distribution for each group were negatively skewed
#However, the sample sizes were both sufficiently large to meet the assumption for Normality.
#Over the semester, student happiness decreased by an average of 1.27%.
#This was not a statistically significant change(t=1.684,p=0.094)
#Overall, there does not appear to be any significant difference in levels
#of student happiness based on their year in colege,
#or the time of the semester.