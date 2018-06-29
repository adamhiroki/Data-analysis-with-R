# From professional bull rider data in SDS Foundations package
# We are trying to figure out if there is a linear relationship
# between how often a rider placed in the Top 10 and
# the number of times he stayed on his bull for a full 8 seconds
# in 2013 season

library(SDSFoundations)
bull <- BullRiders

#Subset for riders that participated in at least one event in 2013
new_bull <- bull[bull$Events13  > 0 ,]

# Visualize and describe the first variable of interest
hist(new_bull$Rides13)
fivenum(new_bull$Rides13)
mean(new_bull$Rides13)
sd(new_bull$Rides13)

# Visualize and describe the second variable of interest
hist(new_bull$Top10_13)
fivenum(new_bull$Top10_13)
mean(new_bull$Top10_13)
sd(new_bull$Top10_13)

# Create a scatterplot
plot(new_bull$Rides13,new_bull$Top10_13)

# Add line of best fit
abline(lm(new_bull$Top10_13~new_bull$Rides13))

# Calculate the correlation coefficient
cor(new_bull$Rides13,new_bull$Top10_13)

# Create a correlation matrix 
vars <- c("Top10_13", "Rides13")
cor(new_bull[,vars])

# We figure out that there is a strong positive linear relationship
# between the number of 8-second rides a bull rider completed
# and the total number of times he made it in the Top 10 
# after 2013 season (r = 0.917)
# The average number of rides for these bull riders was around 19,
# with no significant outliers