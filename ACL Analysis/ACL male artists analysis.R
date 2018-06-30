# From Austin City Limits(ACL) data in SDS Foundations package
# We are trying to figure out if there is an association between
# winning a Grammy and the genre of the music that male artists play

library(SDSFoundations)
acl <- AustinCityLimits

#Subset the data for male artists
male <-acl[acl$Gender == 'M',]

# Create tables of marginal distributions
genre <- table(male$Genre)
genre
grammy <- table(male$Grammy)
grammy

# Create contingency table 
combination <- table(male$Grammy,male$Genre)
combination

# Visualize the counts
barplot(combination, legend=T, beside=T)

# Calculate P(A): the probability of winning Grammy
prop.table(grammy)

# Calculate P(A|B): the probability of winning Grammy, given the artist’s Genre
prop.table(combination,2)

# We found out that there is an association between winning a Grammy
# and the Genre of music being played by the male artists
# The probability of winning Grammy, regardless of Genre, is 43.21%
# However, closed examination of contigency table containing
# both Grammy and Genre showed the conditional probability
# of winning a Grammy changes by genre
