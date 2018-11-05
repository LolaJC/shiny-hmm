library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("HMM"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    sliderInput("observations", 
                "Number of observations:", 
                min = 100,
                max = 3000, 
                value = 100),
    sliderInput("lambda1", 
                "Lambda:", 
                min = 1,
                max = 30, 
                value = 12),
    sliderInput("lambda2", 
                "Lambda:", 
                min = 1,
                max = 30, 
                value = 6)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot")
  )
))
