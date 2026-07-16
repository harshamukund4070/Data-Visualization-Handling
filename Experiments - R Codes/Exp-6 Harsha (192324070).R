#=========================================
# Product Sales Analysis
#=========================================

# Install Packages (Run only once)
install.packages("ggplot2")
install.packages("tidyr")
install.packages("gridExtra")

# Load Libraries
library(ggplot2)
library(tidyr)
library(gridExtra)

#=========================================
# Create Dataset
#=========================================

sales_data <- data.frame(
  Product_ID = c(1,2,3),
  Product_Name = c("Product A","Product B","Product C"),
  January_Sales = c(2000,1500,1200),
  February_Sales = c(2200,1800,1400),
  March_Sales = c(2400,1600,1100)
)

print(sales_data)

#=========================================
# Convert Data to Long Format
#=========================================

sales_long <- pivot_longer(
  sales_data,
  cols = c(January_Sales, February_Sales, March_Sales),
  names_to = "Month",
  values_to = "Sales"
)

sales_long$Month <- factor(
  sales_long$Month,
  levels = c("January_Sales","February_Sales","March_Sales"),
  labels = c("January","February","March")
)

#=========================================
# 1. Grouped Bar Chart
#=========================================

ggplot(sales_long,
       aes(x = Month,
           y = Sales,
           fill = Product_Name)) +
  geom_bar(stat = "identity",
           position = "dodge") +
  labs(
    title = "First Quarter Product Sales",
    x = "Month",
    y = "Sales",
    fill = "Product"
  ) +
  theme_minimal()

#=========================================
# 2. Stacked Area Chart
#=========================================

ggplot(sales_long,
       aes(x = Month,
           y = Sales,
           fill = Product_Name,
           group = Product_Name)) +
  geom_area(alpha = 0.8) +
  labs(
    title = "Overall Sales Trend",
    x = "Month",
    y = "Sales"
  ) +
  theme_minimal()

#=========================================
# 3. Monthly Sales Table
#=========================================

tableGrob(sales_data)