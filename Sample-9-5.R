# The following code loads the file DLAT-Sample-9-5.csv and computes the 
# correlation between the observation.
library(readr)
install.packages("corrplot") # Run this once
library(corrplot)

activity <- read_csv("DLAT-Practice-9-5.csv")
View(activity)

# Extract the correlation and assign it to a matrix
cor(activity)
M <-cor(activity)
# Plot the correlation matrix using color coding.
corrplot(M, method="circle")
