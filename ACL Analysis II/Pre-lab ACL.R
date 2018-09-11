#in Austin City Limits(ACL) that we have,
#we want to find out if there are an equal number of male and female performers on ACL
# and we also want to know
#are male performes just as likely to have had a Top 10 hit as female performers?

library(SDSFoundations)
acl <- AustinCityLimits

Question 1 (Goodness of Fit)
# Create a table of counts for Gender
gender_tab <-table(acl$Gender)
gender_tab

# Create vector of expected proportions
ExpGender <- c(.50, .50)

# Check expected counts assumption
chisq.test(gender_tab, p=ExpGender)$expected

# Run goodness of fit
chisq.test(gender_tab, p=ExpGender)


Question 2 (Test of Independence)
# Create two-way table
gender_top10 <-table(acl$Gender, acl$BB.wk.top10)
gender_top10

# Generate expected counts
chisq.test(gender_top10, correct=FALSE)$expected

# Run test of independence
chisq.test(gender_top10, correct=FALSE)


#We figure out that in our sample, there were 81 males and 35 females
#A chi square goodness of fit test showed that this difference was  satistically significant
#(chi square=18.24 df = 1, p < 0.05)
#There are more males than females on the show.
#For the second question,
#We found out that approximately 55% of the female artist had a Top 10 hit,
#and 46% of the male artist had a Top 10 hits.
#This difference was statistically significant.
#A chi square test of independent test found top 10 hits to be independent of gender
#(chi square = 0.7, df=1, p=0.403) The assumptions for each test were met.