# Reads the data into a data frame called activity.
activity <-read.csv(file = "DLAT-Sample-9-1-1.csv",header=T, na.strings=c(""))

# To check if the dataset contains missing values, us the is.na() function.
# Option 1: Removing records that contain missing values.
is.na(activity) # Shows whether there is a missing data in each row
activity = na.omit(activity) # Removes the rows with missing data


# Option 2: Removing the column that contains several missing values
activity <-read.csv(file = "DLAT-Sample-9-1-1.csv",header=T, na.strings=c(""))
is.na(activity) # Again check which columns has a lot of rows with missing data
activity = activity[,-13] #As we saw using is.na(activity) function, Journal
# at index 13 contains the highest number of missing values

# Then remove rows that contains missing values
activity = na.omit(activity)
activity

# Option 3: Impute the data with the median/average or mode value
activity <- read.csv(file = "DLAT-Sample-9-1-1.csv", header = T, na.strings = c(""))
activity <- activity[, -13] # As we saw using is.na(activity) function, Journal
# at index 13 contains the highest number of missing values

install.packages("DescTools")                # Install DescTools package
library("DescTools")  #Used to calculate Mode. 

# Check the most frequent observation in the transport column
print(Mode(activity$Transport, na.rm = TRUE))

# Replace missing values with the Mode
activity$Transport[is.na(activity$Transport)] <- Mode(activity$Transport, na.rm = TRUE)
activity

