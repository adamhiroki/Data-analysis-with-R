#We want to find out if each of the four musical genres equally represented on ACL,
#and are some genres more likely to draw a large(100K+)Twitter following than others?

library(SDSFoundations)
acl <- AustinCityLimits

Question 1 (Goodness of Fit)
# Create a table of counts for Genre
genre_tab <-table(acl$Genre)
genre_tab

# Create vector of expected proportions
ExpGenre <- c(.25, .25, .25, .25)

# Check expected counts assumption
chisq.test(genre_tab, p=ExpGenre)$expected

# Run goodness of fit
chisq.test(genre_tab, p=ExpGenre)


Question 2 (Test of Independence)
# Create two-way table
genre_twit <-table(acl$Genre, acl$Twitter.100k)
genre_twit

# Generate expected counts
chisq.test(genre_twit, correct=FALSE)$expected

# Run test of independence
chisq.test(genre_twit, correct=FALSE)

#From this analysis, first we examined whether genres were represented equally at ACL
# In our sample, there were 18 country, 13 jazz/blues, 68 rock/folk/indie,
#and 17 singer/songwriter acts. A chi-square goodness of fit test,
#showed that this difference was statistically significant.
#(Chi square = 70.41,df=3,p<0.05)
#There is a higher represenation of rock/folk/indie artists than other artists on the show
# For the second question, a chi-square test of independence revealed that
# there was no significant finding -- a large twitter following was
#independent of genre(chi square=5.69,df=3,p-value=0.1276)
