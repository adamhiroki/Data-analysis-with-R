# From Austin City Limits(ACL) data in SDS Foundations package
# We are trying to figure out, for artists age 30 or older,
# do female artists play different kinds of music on ACL than
# male artists?


library(SDSFoundations)
acl <- AustinCityLimits

#Subset the data for artists age 30 or older
older <-acl[acl$Age>=30,]

# Create tables of marginal distributions
genre <- table(older$Genre)
genre
gender <- table(older$Gender)
gender

# Create contingency table 
twoway <- table(older$Gender,older$Genre)
twoway

# Visualize the counts
barplot(twoway, legend=T, beside=T)

# Calculate P(A): the probability of each genre being played
prop.table(genre)

# Calculate P(A|B): the probability of each genre being played, given the artist’s gender
prop.table(twoway,1)

# We found out that there are 4 genres in ACL (Country, Jazz, rock, Singer-Songwriter)
# Rock was the most frequent played genre, performed by 59.8% of ACL's artists.
# Among female artists, only 32% played Rock music
# This difference between marginal and conditional probabilities 
# showcase that gender and genre are not independent.
# The barplot also an evidence of how females were more likely
# to perform Singer-Songwriter genre than their male counterparts