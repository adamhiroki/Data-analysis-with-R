# From the summer Olympics data (SDS Foundations package)
# We are trying to figure out how has the men's shotput
# world record changed over time?
# What about the women's world record?

library(SDSFoundations)
WR <- WorldRecords

#Subset the data
menshot <- WR[WR$Event=='Mens Shotput',]
womenshot <- WR[WR$Event=='Womens Shotput',] 

#Create scatterplots
plot(menshot$Year,menshot$Record,main='Mens Shotput World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)
plot(womenshot$Year,womenshot$Record,main='Womens Shotput World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)

#Run linear models
linFit(menshot$Year, menshot$Record)
linFit(womenshot$Year,womenshot$Record)

# From our analysis, based on the scatterplots of
# men's and women's world record shotput distance,
# we found out that both of these events follow a strong (+)
# linear relationship over time
# Men's world record distance increases by an average of 0.134 meters per year,
# while the women's world record distance increases by an average of 0.234 meter per year
# The intercept is not interpretable in this context, because it symbolize 
# value of the record distance when year is equal to 0
# Both linear model fits the data well, with R-squared values
# for men's and women's models equal to 0.941 and 0.962 respectively