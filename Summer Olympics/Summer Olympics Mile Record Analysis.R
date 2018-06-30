# From the summer Olympics data (SDS Foundations package)
# We are trying to figure out how many world record times
# for the men's and women's mile event changed over the years?

library(SDSFoundations)
WR <- WorldRecords

#Subset the data
mensmile <- WR[WR$Event=='Mens Mile',]
womenmile <- WR[WR$Event=='Womens Mile',] 

#Create scatterplots
plot(mensmile$Year,mensmile$Record,main='Mens Mile World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)
plot(womenmile$Year,womenmile$Record,main='Womens Mile World Records',xlab='Year',ylab='World Record Distance (m)',pch=16)

#Run linear models
linFit(mensmile$Year, mensmile$Record)
linFit(womenmile$Year,womenmile$Record)

# From our analysis, based on the scatterplots of
# men's and women's world record mile distance,
# we found out that both of these events follow a strong (-)
# linear relationship over time
# Men's world record distance decreases by an average of 0.393 seconds per year,
# while the women's world record distance decreases by an average of 0.973 meter per year
# The intercept is not interpretable in this context, because it symbolize 
# value of the record distance when year is equal to 0
# Both linear model fits the data well, with R-squared values
# for men's and women's models equal to 0.977 and 0.896 respectively