# Comparing the weight of adult cats and dogs in the shelter
# How typical would it be to find a 13-pound cat? 
# What about a 13-pound dog?

library(SDSFoundations)
animaldata <- AnimalData

#subset the data to only include animal that is at least 1 years old
adult <- animaldata[animaldata$Age.Intake >= 1, ]

#create a table that showcase adult cats and dogs proportion
table(adult$Animal.Type)

#subset of only dog & cat data
dog <- adult[adult$Animal.Type == "Dog", ]
cat <- adult[adult$Animal.Type == "Cat", ]

#visualization of dogs and cats weight
hist(dog$Weight)
hist(cat$Weight)

#shows Standar Deviation of both dog and cat data
sd(dog$Weight)
sd(cat$Weight)

#shows cat mean
mean(cat$Weight)

# This data shows that adult cats has roughly symmetric distribution
# with a mean of 8.6 lbs. and S.D. of 1.9 pounds
# The adult dogs data shows positively skewed distribution
# with median of 35.3 lbs. and IQR of 40.4 lbs 
# Based on the information, a 13-lbs cat would not be typical at the shelter
# At the other hand, 75% of all dogs weigh more than 13 lbs.