#Finding how many cyclist were students, and also figuring out
#often they ride, and what was the average distance they rode?

library(SDSFoundations)
bike <- BikeData

# Find the number of students in the dataset
table(bike$student)

# Pull out student data into a new dataframe
student <-bike[bike$student==1,]

# Find how often the students ride, using the new dataframe
table(student$cyc_freq)

# Create a vector for the distance variable
distance <-student$distance

# Find average distance ridden
mean(distance)

#This examination showcase 14 student riders
#Most student riders(8 out of 14) rode their bikes daily
#On average, student rode about 6.26 miles on each trip