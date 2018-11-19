# shiny-hmm
A shiny app using hidden Markov model.

Simulate a 2-state normal HMM with a number of observations chosen between 100 and 3000.
Both states follow a Poisson distribution, the lambdas can be chosen using two sliders.

A graph represents the sequence versus the time. States are represented by two colors: red and black.

States are estimated using HMM. Estimated states are displayed bellow the graph.
