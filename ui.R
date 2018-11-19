library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("HMM"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    sliderInput("observations", 
                "Number of observations for the 2-state normal HMM:", 
                min = 100,
                max = 3000, 
                value = 100),
    sliderInput("lambda1", 
                "Lambda for the Poisson distribution of the state 1:", 
                min = 1,
                max = 30, 
                value = 12),
    sliderInput("lambda2", 
                "Lambda for the Poisson distribution of the state 2:", 
                min = 1,
                max = 30, 
                value = 6)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot",  height = 600, width = "100%"),
    helpText("Estimated states are displayed bellow the graph")
  )
))
