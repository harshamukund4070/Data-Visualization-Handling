#=========================================
# Customer Feedback Analysis
#=========================================

# Install Packages (Run only once)
install.packages("ggplot2")
install.packages("wordcloud")
install.packages("RColorBrewer")

# Load Libraries
library(ggplot2)
library(wordcloud)
library(RColorBrewer)

#=========================================
# Create Dataset
#=========================================

customer_data <- data.frame(
  Customer_ID = c(1, 2, 3, 4, 5),
  Age = c(25, 30, 35, 28, 40),
  Satisfaction_Score = c(4, 5, 3, 4, 5)
)

print(customer_data)

#=========================================
# 1. Histogram of Customer Ages
#=========================================

ggplot(customer_data, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(
    title = "Distribution of Customer Ages",
    x = "Age",
    y = "Frequency"
  ) +
  theme_minimal()

#=========================================
# 2. Pie Chart of Satisfaction Scores
#=========================================

score_table <- table(customer_data$Satisfaction_Score)

pie(
  score_table,
  labels = paste(names(score_table), score_table),
  main = "Customer Satisfaction Score Distribution",
  col = rainbow(length(score_table))
)

#=========================================
# 3. Stacked Bar Chart
#=========================================

customer_data$Age_Group <- cut(
  customer_data$Age,
  breaks = c(20, 30, 40, 50),
  labels = c("20-30", "31-40", "41-50"),
  include.lowest = TRUE
)

ggplot(customer_data,
       aes(x = Age_Group,
           fill = factor(Satisfaction_Score))) +
  geom_bar() +
  labs(
    title = "Customer Satisfaction by Age Group",
    x = "Age Group",
    y = "Number of Customers",
    fill = "Satisfaction Score"
  ) +
  theme_minimal()

#=========================================
# 4. Word Cloud
#=========================================

feedback <- c(
  "Excellent",
  "Service",
  "Very",
  "Satisfied",
  "Good",
  "Quality",
  "Fast",
  "Delivery",
  "Excellent",
  "Support",
  "Good",
  "Experience",
  "Friendly",
  "Staff",
  "Satisfied",
  "Customer",
  "Quick",
  "Response",
  "Excellent",
  "Product"
)

freq <- table(feedback)

wordcloud(
  words = names(freq),
  freq = as.numeric(freq),
  scale = c(4, 1),
  min.freq = 1,
  random.order = FALSE,
  rot.per = 0.2,
  colors = brewer.pal(8, "Dark2")
)