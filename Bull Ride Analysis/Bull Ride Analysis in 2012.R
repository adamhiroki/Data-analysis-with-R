# From professional bull rider data in SDS Foundations package
# We are trying to figure out which variable had the strongest linear relationship
# with Earnings: Ride % or Cup Points?

library(SDSFoundations)
bull <- BullRiders

#Subset for riders that participated in at least one event in 2012
new_bull <- bull[bull$Events12  > 0 ,]


#visualization and average Earnings in 2012
hist(new_bull$Earnings12)
median(new_bull$Earnings12)

#showcase linear relationship between Earnings and Cup Points in 2012
plot(new_bull$Earnings12,new_bull$CupPoints12)
abline(lm(new_bull$CupPoints12~new_bull$Earnings12))
cor(new_bull$Earnings12,new_bull$CupPoints12)

#showcase linear relationship between Earnings and Ride % in 2012
plot(new_bull$Earnings12,new_bull$RidePer12)
abline(lm(new_bull$RidePer12~new_bull$Earnings12))
cor(new_bull$Earnings12,new_bull$RidePer12)

#remove outlier
nooutlier <- new_bull[new_bull$Earnings12 < 1000000 ,] 

#shows linear relationship between Earnings and Cup Points in 2012 after removing outlier
plot(nooutlier$Earnings12,nooutlier$CupPoints12)
abline(lm(nooutlier$CupPoints12~nooutlier$Earnings12))
cor(nooutlier$Earnings12,nooutlier$CupPoints12)

#shows linear relationship between Earnings and Ride % in 2012 after removing outlier
plot(nooutlier$Earnings12,nooutlier$RidePer12)
abline(lm(nooutlier$RidePer12~nooutlier$Earnings12))
cor(nooutlier$Earnings12,nooutlier$RidePer12)

# In this dataset, that consist of riders who 
# participated in at least one event in 2012,
# It shows that Cup Points had the stronger relationship with Earnings
# With correlation of 0.657
# But after examining and removing the outlier, there is an increase 
# in the value of correlation for the relationship
# between Cup Points and Earnings with the value of 0.893
# Cup point and Earnings still had the highest relationship.
