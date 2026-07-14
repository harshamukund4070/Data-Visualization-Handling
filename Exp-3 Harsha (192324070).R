#=========================================
# Employee Performance Evaluation
#=========================================

# Install Package (Run only once)
install.packages("ggplot2")

# Load Library
library(ggplot2)

#=========================================
# Create Dataset
#=========================================

employee_data <- data.frame(
  Employee_ID = c(1, 2, 3, 4, 5),
  Department = c("Sales", "HR", "Marketing", "Sales", "HR"),
  Years_of_Service = c(5, 3, 7, 4, 2),
  Performance_Score = c(85, 92, 78, 90, 76)
)

print(employee_data)

#=========================================
# 1. Line Chart
#=========================================

ggplot(employee_data,
       aes(x = Years_of_Service,
           y = Performance_Score,
           color = "Performance")) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 3) +
  labs(
    title = "Employee Performance Trend",
    x = "Years of Service",
    y = "Performance Score",
    color = "Legend"
  ) +
  theme_minimal()

#=========================================
# 2. Bar Chart
#=========================================

ggplot(employee_data,
       aes(x = Department,
           fill = Department)) +
  geom_bar() +
  labs(
    title = "Employees by Department",
    x = "Department",
    y = "Number of Employees"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

#=========================================
# 3. Scatter Plot
#=========================================

ggplot(employee_data,
       aes(x = Years_of_Service,
           y = Performance_Score)) +
  geom_point(color = "blue", size = 4) +
  labs(
    title = "Years of Service vs Performance Score",
    x = "Years of Service",
    y = "Performance Score"
  ) +
  theme_minimal()

#=========================================
# Scatter Plot Insights
#=========================================

cat("\nScatter Plot Insights:\n")
cat("1. The relationship between years of service and performance is weak.\n")
cat("2. Employees with fewer years of service can also have high performance scores.\n")
cat("3. Performance depends on multiple factors, not only years of experience.\n")
cat("4. No strong positive or negative correlation is observed.\n")