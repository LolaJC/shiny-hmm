library(shiny)

shinyServer(function(input, output) {
  
 output$distPlot <- renderPlot({
    n <- input$observations
    lambda <- c(input$lambda1, input$lambda2)
    proba1 <- 0.8 #input$proba1
    proba2 <- 1 - proba1
    gamma <- matrix(c(proba1, proba2, proba2, proba1), byrow = T, ncol = 2)
    state <- numeric(n)
    # Attribute the first observation in the sequence
    state[1] <- sample(1:2, 1, prob = c(0.4,0.6))
    # Sample the following observations
    for (i in 2:n){
     state[i] <- sample(1:2, 1, prob = gamma[state[i-1],])
    }
    x <- rpois(n, lambda = lambda[state])
    data <- list(state = state, seq = x)
    
    dist <- rpois(n, lambda=input$lambda1)
    plot(data$seq, type ='l', xlab = "Time", ylab = "Outcome", lwd = 2, lty = 3, xaxt = 'n')
  })
})
