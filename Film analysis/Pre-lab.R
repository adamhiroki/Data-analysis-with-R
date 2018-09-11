#From this dataset, we want to figure out
#does a film's rating(PG,PG-13, or R)impact its cost to produce?
#does a film's rating(PG,PG-13, or R)influence its IMDB score?

library(SDSFoundations)
film <- FilmData

# Show how many films are in each group
table(film$Rating)

Question 1

# Calculate avg film budget of each group
aggregate(Budget~Rating,film,mean)

# Calculate sd of film budget within each group
aggregate(Budget~Rating,film,sd)

# Visualize the group means and variability
boxplot(film$Budget~film$Rating, main= "Film Budgets by Rating",
        ylab= "Budget", xlab= "MPAA Rating")

# Run ANOVA
modelbud <- aov(film$Budget~film$Rating)
summary(modelbud)

# Run post-hoc test if F statistic is significant
TukeyHSD(modelbud)

Question 2

# Calculate avg IMDB score of each group
aggregate(IMDB~Rating,film,mean)

#Calculate sd of IMDB scores within each group
aggregate(IMDB~Rating,film,sd)

# Visualize the group means and variability
boxplot(film$IMDB~film$Rating, main= "IMDB Scores by Rating",
        ylab= "IMDB Score", xlab= "MPAA Rating")

# Run ANOVA
modelscore <- aov(film$IMDB~film$Rating)
summary(modelscore)

# Run post-hod text if F statistic is significant
TukeyHSD(modelscore)

#From this analysis, we found out that the average cost of a film was found to vary
#depending on its MPAA rating (F=13.1, p<0.05).
#In a Tukey HSD test, Pg-13 films were shown to cost significantly more on average ($127M)
#than PG films($75M). PG-13 films fell just shy of costing significantly more
#than R rated films(p=0.053)
#The average IMDB score of a film does not appear to vary with MPAA rating
#(F=0.3,p=0.74)
#The average ratings for all 3 categories of film were close to 7 on a scale of 1-10.