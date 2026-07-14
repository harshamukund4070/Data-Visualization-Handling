#=========================================
# Product Inventory Management
#=========================================

# Install Package (Run only once)
install.packages("ggplot2")

# Load Library
library(ggplot2)

#=========================================
# Create Dataset
#=========================================

inventory_data <- data.frame(
  Product_ID = c(1,2,3,4,5),
  Product_Name = c("Product A","Product B","Product C","Product D","Product E"),
  Category = c("Electronics","Electronics","Furniture","Furniture","Accessories"),
  Quantity_Available = c(250,175,300,200,220),
  Product_Price = c(1200,900,1500,1100,800)
)

print(inventory_data)

#=========================================
# 1. Bar Chart
#=========================================

ggplot(inventory_data,
       aes(x = Product_Name,
           y = Quantity_Available,
           fill = Product_Name)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Quantity Available for Each Product",
    x = "Product Name",
    y = "Quantity Available"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

#=========================================
# 2. Stacked Bar Chart
#=========================================

ggplot(inventory_data,
       aes(x = Category,
           y = Quantity_Available,
           fill = Product_Name)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Product Quantity by Category",
    x = "Product Category",
    y = "Quantity Available",
    fill = "Products"
  ) +
  theme_minimal()

#=========================================
# 3. Scatter Plot
#=========================================

ggplot(inventory_data,
       aes(x = Product_Price,
           y = Quantity_Available)) +
  geom_point(size = 4, color = "blue") +
  labs(
    title = "Product Price vs Quantity Available",
    x = "Product Price",
    y = "Quantity Available"
  ) +
  theme_minimal()

#=========================================
# Scatter Plot Insights
#=========================================

cat("\nScatter Plot Insights:\n")
cat("1. The relationship between product price and quantity available is weak.\n")
cat("2. High-priced products do not always have higher inventory.\n")
cat("3. Inventory levels depend on product demand and stock planning.\n")
cat("4. No strong positive or negative correlation is observed.\n")