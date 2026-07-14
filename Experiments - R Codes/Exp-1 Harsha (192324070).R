# Install packages (Run once)
install.packages("shiny")
install.packages("ggplot2")

# Load libraries
library(shiny)
library(ggplot2)

# Sales Data
sales_data <- data.frame(
  Month = c("January","February","March","April","May"),
  Sales = c(15000,18000,22000,20000,23000),
  Advertising_Budget = c(2000,2500,3000,2800,3500)
)

# Product Data
product_data <- data.frame(
  Product = c("Laptop","Mobile","Tablet","Headphones","Smart Watch"),
  Sales = c(50000,42000,30000,20000,25000)
)

# User Interface
ui <- fluidPage(
  
  titlePanel("Interactive Sales Dashboard"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput(
        "chart",
        "Select Chart:",
        choices = c(
          "Monthly Sales Line Chart",
          "Top Selling Products Bar Chart",
          "Advertising Budget vs Sales Scatter Plot"
        )
      )
      
    ),
    
    mainPanel(
      
      plotOutput("salesPlot", height = "500px")
      
    )
    
  )
  
)

# Server
server <- function(input, output) {
  
  output$salesPlot <- renderPlot({
    
    if(input$chart == "Monthly Sales Line Chart"){
      
      ggplot(sales_data,
             aes(x = Month, y = Sales, group = 1)) +
        geom_line(color = "blue", linewidth = 1.2) +
        geom_point(color = "red", size = 3) +
        labs(
          title = "Monthly Sales",
          x = "Month",
          y = "Sales ($)"
        ) +
        theme_minimal()
      
    }
    
    else if(input$chart == "Top Selling Products Bar Chart"){
      
      ggplot(product_data,
             aes(x = Product, y = Sales, fill = Product)) +
        geom_bar(stat = "identity") +
        labs(
          title = "Top Selling Products",
          x = "Product",
          y = "Annual Sales ($)"
        ) +
        theme_minimal() +
        theme(legend.position = "none")
      
    }
    
    else{
      
      ggplot(sales_data,
             aes(x = Advertising_Budget, y = Sales)) +
        geom_point(color = "darkgreen", size = 4) +
        labs(
          title = "Advertising Budget vs Sales",
          x = "Advertising Budget ($)",
          y = "Sales ($)"
        ) +
        theme_minimal()
      
    }
    
  })
  
}

# Run Dashboard
shinyApp(ui = ui, server = server)
