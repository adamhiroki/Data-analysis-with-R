#From this dataset, we want to find out which studio(s) earn a greater % of their earnings domestically?
#which studio(s) are more succesful in keeping their films in theaters longer?

library(SDSFoundations)
film <- FilmData

# Show how many films are in each group
table(film$Studio)

Question 1

# Calculate avg film stays on the Cinema of each group
aggregate(Days~Studio,film,mean)

# Calculate sd of film stays on the Cinema within each group
aggregate(Days~Studio,film,sd)

# Visualize the group means and variability
boxplot(film$Days~film$Studio, main= "Film Days in Cinema by Studio",
        ylab= "Days", xlab= "Studio")

# Run ANOVA
modelbud <- aov(film$Days~film$Studio)
summary(modelbud)

# Run post-hoc test if F statistic is significant
TukeyHSD(modelbud)


Question 2

# Calculate avg domestic earning of each group
aggregate(Pct.Dom~Studio,film,mean)

#Calculate sd of IMDB scores within each group
aggregate(Pct.Dom~Studio,film,sd)

# Visualize the group means and variability
boxplot(film$Pct.Dom~film$Studio, main= "Domestic Earning % by Studio",
        ylab= "Domestic Earning %", xlab= "Studio")

# Run ANOVA
modelscore <- aov(film$Pct.Dom~film$Studio)
summary(modelscore)

# Run post-hod text if F statistic is significant
TukeyHSD(modelscore)

#This analysis examined 151 top-grossing films produced by 5 majos tudios.
#Analysis revealed a difference in the number of days a film spent in the theater,
#by studio(F(4,146)=5.354,p<0.05). In a Tukey HSD test, Fox films stayed
#in the theater significantly longer(155 days) than both Universal(130 days)
#and Sony Studios(114 days). Sony studios was also significantly lower than Warner Bros. Studios
#An additional analysis did not reveal a significant difference in the % of earnings domestically,
#across the five different studios (F(4,146)=2.097,p=0.084)