#=========================================
# Website Analytics
#=========================================

# Install Package (Run only once)
install.packages("ggplot2")

# Load Library
library(ggplot2)

#=========================================
# Create Dataset
#=========================================

website_data <- data.frame(
  Date = as.Date(c("2023-01-01",
                   "2023-01-02",
                   "2023-01-03",
                   "2023-01-04",
                   "2023-01-05")),
  Page_Views = c(1500,1600,1400,1650,1800),
  Click_Through_Rate = c(2.3,2.7,2.0,2.4,2.6),
  Likes = c(120,135,110,145,160),
  Shares = c(45,50,40,55,60),
  Comments = c(30,35,28,38,42)
)

print(website_data)

#=========================================
# 1. Line Chart
#=========================================

ggplot(website_data,
       aes(x = Date, y = Page_Views, group = 1)) +
  geom_line(color = "blue", linewidth = 1.2) +
  geom_point(color = "red", size = 3) +
  labs(
    title = "Daily Page Views Trend",
    x = "Date",
    y = "Page Views"
  ) +
  theme_minimal()

#=========================================
# 2. Bar Chart
#=========================================

top_data <- website_data[order(-website_data$Click_Through_Rate), ]

ggplot(top_data,
       aes(x = reorder(as.character(Date), Click_Through_Rate),
           y = Click_Through_Rate,
           fill = Click_Through_Rate)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Top Click-Through Rates",
    x = "Date",
    y = "Click-Through Rate (%)"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

#=========================================
# 3. Stacked Area Chart
#=========================================

interaction_data <- data.frame(
  Date = rep(website_data$Date, 3),
  Interaction = rep(c("Likes","Shares","Comments"),
                    each = nrow(website_data)),
  Count = c(website_data$Likes,
            website_data$Shares,
            website_data$Comments)
)

ggplot(interaction_data,
       aes(x = Date,
           y = Count,
           fill = Interaction)) +
  geom_area() +
  labs(
    title = "User Interactions Distribution",
    x = "Date",
    y = "Count"
  ) +
  theme_minimal()