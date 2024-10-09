df = read.csv('Unemployment data - Sheet1.csv')
df
library(tidyverse)
library(ggplot2)


# Create a line chart with highlighted points
ggplot(df, aes(x = Month, y = Unemployment.Rate, group = 1)) +
  geom_line(color = "black", size = 1) +    # Line for the trend
  geom_point(color = 'red', size = 3) +     # Red points on the line
  theme_minimal() +                         # Optional clean theme
  labs(title = "Unemployment Rate Over Time",
       x = "Month",
       y = "Unemployment Rate") 