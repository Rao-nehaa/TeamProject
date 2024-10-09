library(ggplot2)
library(scales)
library(lubridate)
library(reshape2)
library(plotly)

# Assuming 'df' is your dataframe and it has been read from the Excel file
df <- read.csv("average-hours-per-day-sp-Data.csv")

# Clean the column names (optional if needed)
colnames(df) <- make.names(colnames(df))

# Melt the data for better plotting (convert wide to long format)
data_long <- melt(df, id.vars = "Activity",
                  measure.vars = c("Average.per.day.men", "Average.per.day.women"),
                  variable.name = "Group", value.name = "Hours")

# Create the facet wrap plot with data labels
p <-ggplot(data_long, aes(x = Activity, y = Hours, fill = Group)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = round(Hours, 1)), vjust = -1,nudge_y = 0.7) +  # Add data labels with rounded values
  facet_wrap(~ Group) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "Average Hours per Day by Activity", x = "Activity", y = "Average Hours")

# Convert the ggplot object to a plotly object
p_interactive <- ggplotly(p)

# Display the interactive plot
p_interactive