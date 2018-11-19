library(shiny)
library(ggplot2)
library(depmixS4)

shinyServer(function(input, output) {
  
 output$distPlot <- renderPlot({
    # Initialise variables
    n <- input$observations
    lambda <- c(input$lambda1, input$lambda2)
    proba1 <- 0.8
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
    data <- data.frame(state = state, seq = x, time = 1:n)

    # Estimate the states using HMM
    model <- depmix(seq~1, data = as.data.frame(data), nstates = 2, family = gaussian(), ntimes = c(n))
    out.model <- fit(model)
    viterbi.states <- posterior(out.model)[,1]
    
    # Plot the sequence
    ggplot(data, aes(x = time ,y = seq, colour = state)) + 
      geom_line() +
      geom_point() +
      # Change the colors
      scale_color_gradient(low="red", high="black") +
      # Change the theme
      theme_minimal() +
      # Add estimated states
      geom_point(data = as.data.frame(viterbi.states), mapping = aes( x = c(1:n), y = rep(-1, n), colour = viterbi.states)) +
      # Modify title and axis names
      labs(x = "Time", y = "Sequence", title = "Sequence vs. time") +
      # Center the title
      theme(plot.title = element_text(hjust = 0.5))

  })
})
