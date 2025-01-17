# Load the ggplot2 library
library(ggplot2)
library(readr)

# Read the import export data from a file
data <- read_csv("IE_import_export.csv")

# Show the names of the columns
print(names(data))

# Now let's plot a simple graph with showing the imports for each month
# pass the x and y variables. See the labels on the x and y axis
# This does not show any of the plots or the lines as we do not set the geometric objects
ggplot(data, aes(x = Month, y = Import))

# Tells ggplot not to sort the data alphabetically when it plots it.
data$Month <- factor(data$Month, levels = data$Month)

# Set the geometric object to points and lines. Now you can see the coordinate points.
ggplot(data, aes(x = Month, y = Import , group = 1)) + 
  geom_line() 
  


# Adding titles and subtitles to a graph
# now add this to the previous graph
ggplot(data, aes(x = Month, y = Import , group = 1)) + 
geom_line() + labs(title = "Irish import export data",
                     subtitle = "The year 2021"
)

# Now let's add the x- and y-axis labels changing the default
ggplot(data, aes(x = Month, y = Import , group = 1)) + 
geom_line() +
labs(title = "Irish import export data",
                     subtitle = "The year 2021",
                     x= "Months of the year",
                     y= "Import in million dollars"
)

# to align the title and subtitle,
ggplot(data, aes(x = Month, y = Import , group = 1)) + 
  geom_line() +
  labs(title = "Irish import export data",
       subtitle = "The year 2021",
       x= "Months of the year",
       y= "Import in million dollars"
) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(plot.subtitle = element_text(hjust = 0.5)) 

 #you can also increase the font, color size, angle etc along witht the element.

# to format the title and subtitles, and labels
ggplot(data, aes(x = Month, y = Import , group = 1)) + 
  geom_line() +
  labs(title = "Irish import export data",
       subtitle = "The year 2021",
       x= "Months of the year",
       y= "Import in million dollars"
  ) +
  theme(plot.title = element_text(hjust = 0.5, face ="bold", colour = "blue", size =16)) +
  theme(plot.subtitle = element_text(hjust = 0.5, colour = "blue", size =12)) +
  theme(axis.text.x = element_text(vjust = 0.5, colour = "red", size =11, angle = 75)) 
# axis.text.x changes the horizontal labels and axis.text.y changes the vertical lines



# Now remove the background color
ggplot(data, aes(x = Month, y = Import , group = 1)) + 
  geom_line() +
  geom_point()+ labs(title = "Irish import export data",
                     subtitle = "The year 2021",
                     x= "Months of the year",
                     y= "Import in million dollars" ) + 
  theme_bw()+
  theme(plot.title = element_text(hjust = 0.5, face ="bold", colour = "blue", size =16)) +
  theme(plot.subtitle = element_text(hjust = 0.5, colour = "blue", size =12)) +
  theme(axis.text.x = element_text(vjust = 0.5, colour = "red", size =11, angle = 75)) 


# To get rid of the background color and vertical and horizontal lines use the following
ggplot(data, aes(x = Month, y = Import , group = 1)) + 
  geom_line() +
  geom_point()+ labs(title = "Irish import export data",
                     subtitle = "The year 2021",
                     x= "Months of the year",
                     y= "Import in million dollars" ) + 
  theme_bw()+
  theme(plot.title = element_text(hjust = 0.5, face ="bold", colour = "blue", size =16)) +
  theme(plot.subtitle = element_text(hjust = 0.5, colour = "blue", size =12)) +
  theme(axis.text.x = element_text(vjust = 0.5, colour = "red", size =11, angle = 75)) + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
            panel.background = element_blank(), axis.line = element_line(colour = "black")) +
  theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5))


# To change the transparency of the points or the lines use alpha value
ggplot(data, aes(x = Month, y = Import , group = 1)) + 
  geom_line(alpha =0.25) +
  geom_point(alpha =0.25)+ labs(title = "Irish import export data",
                     subtitle = "The year 2021",
                     x= "Months of the year",
                     y= "Import in million dollars" ) + 
  theme_bw()+
  theme(plot.title = element_text(hjust = 0.5, face ="bold", colour = "blue", size =16)) +
  theme(plot.subtitle = element_text(hjust = 0.5, colour = "blue", size =12)) +
  theme(axis.text.x = element_text(vjust = 0.5, colour = "red", size =11, angle = 75)) + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black")) +
  theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5))
