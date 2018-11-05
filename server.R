library(shiny)

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {
  
 output$distPlot <- renderPlot({
    
    dist <- rpois(input$observations, lambda=input$lambda1)
    plot(dist, xlab = "Time", ylab = "Outcome", lwd = 2, lty = 3, xaxt = 'n')
  })
})
