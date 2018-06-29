#How many days do animals spend in the shelter before they are adopted?
#From SDSFoundations' AnimalData package

library(SDSFoundations)
animaldata <- AnimalData

#Find the number of animals that were adopted
table(animaldata$Outcome.Type)

#Pull out only adopted animals
adopted <- animaldata[animaldata$Outcome.Type=="Adoption",]

#Pull out just the days in shelter for the adopted animals
daystoadopt <- adopted$Days.Shelter

#Visualize and describe this variable
hist(daystoadopt)
fivenum(daystoadopt)
mean(daystoadopt)
sd(daystoadopt)
which(animaldata$Days.Shelter==max(daystoadopt))

# We found out that on average, animals spent fewer than two weeks in the shelter
#before being adopted
# However, the length of time was highly skewed to the right
# The longest period of time an animal was in the shelter was 211 days before being adopted
# This animal was a 2-years-old dog that entered injured
# The middle 50% of the distribution were adopted between 8 and 38 days