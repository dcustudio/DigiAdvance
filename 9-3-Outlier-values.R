library(readr)
library(dplyr)
library("DescTools")
# Detect and remove outlier values

# Read the next activity data set.
activity <- read.csv(file = "DLAT-Sample-9-2.csv", header = T, na.strings = c(""))
activity <- activity[, -13] 

# Now, replace all NA values with the most frequent Transport. To compute that, use the Mode() method from
# DescTools library
activity$Transport[is.na(activity$Transport)] <- Mode(activity$Transport, na.rm = TRUE)
activity

q <-quantile(activity$Duration) #this function returns the quartiles data as
# 0%  25%  50%  75% 100% 
# 30   35   60  180  180
q1 <- quantile(activity$Duration)[2] # returns the first quartile (25%)
q3 <- quantile(activity$Duration)[4] # returns the third quartile (75%)

iqr = q3 - q1 # Interquartile range
ol = iqr * 1.5

cat("The first, third quartiles, and outlier range are:", q1, q3, ol)


#  Now, filter any row containing duration less than q1 -ol and anything greater than q3 +ol
outliers = activity[((activity$Duration < (q1 - ol)) | (activity$Duration > (q3 + ol)) ),]

head(outliers)  #There is one outlier found which is at index 12

activity <- activity[-c(12),] # Remove the outlier column from the dataset

activity # Activity dataset does not have an outlier, because it is removed. 


# Replace the date with the correct format
activity$Date[activity$Date == '08-Jul'] <-'08-07-2022'

# Replace the unit to the correct format (remove 3km to 3)
activity$Distance[activity$Distance == '3km'] <-3

# Compute the median value of the Distance column
med = median(as.integer(a))

# Now replace all the distances with NA to the median value
activity$Distance[is.na(activity$Distance)] <- med

# Finally, write the data to a new file.
write.csv(activity, "DLAT-Sample-9-3.csv")
