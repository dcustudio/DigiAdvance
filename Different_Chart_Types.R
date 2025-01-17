# Load the ggplot2 library
library(ggplot2)
library(readr)

# Read the import export data from a file
data <- read_csv("IE_import_export.csv")

# Show the names of the columns
print(names(data))

# Tells ggplot not to sort the data alphabetically when it plots it.
data$Month <- factor(data$Month, levels = data$Month)

# Bar charts
# ==============================================================================

# vertical bar chart with the y value. Notice that if we do not provide
# the y value, it will generate the bars based on counts.
ggplot(data, aes(x = Month, y = Import, )) + 
  geom_bar(stat = "identity", color= "red", fill ="blue") +
  labs(title = "Irish Import and Export Data", 
       subtitle = "The year 2021",
       x= "Months of the year",
       y= "Import in million dollars") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", colour = "blue", size = 16)) +
  theme(plot.subtitle = element_text(hjust = 0.5, colour = "blue", size = 12)) +
  theme(axis.text.x = element_text(vjust = 0.5, colour = "red", size = 11, angle = 75))

# horizontal using coord_flip()
ggplot(data, aes(x = Month, y = Import, )) + 
  geom_bar(stat = "identity", color= "red", fill ="blue") +
  labs(title = "Irish Import and Export Data", 
       subtitle = "The year 2021",
       x= "Months of the year",
       y= "Import in million dollars") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", colour = "blue", size = 16)) +
  theme(plot.subtitle = element_text(hjust = 0.5, colour = "blue", size = 12)) +
  theme(axis.text.x = element_text(vjust = 0.5, colour = "red", size = 11)) +
  coord_flip()


# Drawing column bars using a single variable
ggplot(data, aes(x = Month, group =1)) + 
  geom_col(aes(y = Export, fill = "Export")) +
  labs(title = "Irish import data", 
       subtitle = "The year 2021",
       x= "Months of the year",
       y= "Import in million dollars" )

# Drawing column bars using multiple variables 
ggplot(data, aes(x = Month, group =1)) + 
  geom_col(aes(y = Export, fill = "Export")) +
  geom_col(aes(y = Import, fill = "Import")) +
  labs(title = "Irish import and export data", 
       subtitle = "The year 2021",
       x= "Months of the year",
       y= "Import in million dollars" ) +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", colour = "blue", size = 16)) +
  theme(plot.subtitle = element_text(hjust = 0.5, colour = "blue", size = 12)) +
  theme(axis.text.x = element_text(vjust = 0.5, colour = "red", size = 11)) 
  



# Scatter plots
# ==============================================================================

ggplot(data, aes(x = Month)) +
  geom_point(aes(y = Import, color = "red")) +
  geom_point(aes(y = Export), color = "blue")




# Histogram
# ==============================================================================
grades <- data.frame(
  grade = c(80, 81, 83, 87, 65, 89, 33, 44, 51, 52, 53, 53, 54, 53, 55, 66, 38, 45, 47, 56, 59, 63, 73, 75, 45, 87, 76, 75, 72, 44)
)
# Histogram with binwidth 5
ggplot(grades, aes(x = grade)) +
  geom_histogram(binwidth = 5, color = "blue", fill = "red")

# You can adjust the binwidth or change the bins to a desired value
# Histogram with bins = 10
ggplot(grades, aes(x = grade)) +
  geom_histogram(bins = 10, color = "grey", fill = "#CB6D51")



# Pie chart
# ==============================================================================
# Pie chart
# Option 1: using the pie() function included in R
library(ggplot2)
require(grDevices)
sales <- data.frame(
  lab = c("Samsung", "Apple", "Google", "Ericson"),
  sale = c(15, 30, 45, 10)
)
# A simple pie chart
pie(sales$sale)
# Customising pie chart
pie(sales$sale, labels = sales$lab, edges =200, radius = 1, clockwise = FALSE)

# Adding colors to the chart
pie(sales$sale, labels = sales$lab, col = c("purple", "violetred1", "green3",
                                            "cornsilk"), edges =200, radius = 1, clockwise = FALSE)



# Option 2:
# Using ggplot

library(ggplot2)
library(dbplyr)
library(tidyverse)
library(repel)

sales <- data.frame(
  company = c("Samsung", "Apple", "Google", "Ericson"),
  sale = c(15, 30, 45, 10)
)
ggplot(sales, aes(x = "", y = sale, fill = company)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) 


# Cleaning the background noise
ggplot(sales, aes(x = "", y = sale, fill = company)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  theme_void()

# changing the position of a legend
ggplot(sales, aes(x = "", y = sale, fill = company)) +
  geom_bar(stat = "identity", width = 1, alpha = .25) +
  coord_polar("y", start = 0) +
  theme_void() +
  theme(legend.position="top") #use top right, centre bottom


# Adding labels
# Compute the position of labels
sales <- sales %>% 
  arrange(desc(company))%>%
  mutate(prop = sale / sum(sales$sale) *100) %>%
  mutate(ypos = cumsum(prop)- 0.5*prop )

ggplot(sales, aes(x = "", y = prop, fill = company)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  theme_void() +
  geom_text(aes(y = ypos, label = prop), color = "white", size=3) 

