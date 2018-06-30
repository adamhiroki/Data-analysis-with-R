# From the World Bank data (SDS Foundations package)
# We are trying to figure out what is the best-fitting model
# for growth of internet usage in Denmark since 1990?

library(SDSFoundations)
world <- WorldBankData

#Create proportion variable to shows the proportion of population using the internet
world$proportion <- world$internet.users / world$population

# Subset data for that only contains data from 1990 onward
modern <- world[world$year >= 1990,]

# Create a new variable in our dataset called time that represents "years since 1990"
modern$time <- modern$year - 1990

# Select the years from 1990 and name the new data frame "us_select"
denmark <- modern[modern$Country == "Denmark", ]

# Use a function to fit an exponential and logistic model
expFit(denmark$time, denmark$proportion)
logisticFit(denmark$time, denmark$proportion)

#Based on the prior model parameters, 
# predict the year the proportion of internet user is 70% of Denmark population
e <- expFitPred(denmark$time,denmark$proportion, 16)
l <- logisticFitPred(denmark$time,denmark$proportion, 14)

# Based on my the observation, we found that the logistic model fit better
# with a high R-squared value of 0.995, compared to exponential's 0.800 value
# The graph also showcase that the logistic model fit nicely 
# into the observation better than the exponential data
# The logistic model shows that the predicted carrying capacity of the proportion 
# of people who use the internet in Denmark was 0.8967
# With using logistic model, we can assume that the proportion of internet user in Denmark
# will level off  rather continuning to grow exponentially