#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
      output$out1 <- renderText(input$box1)
      output$out2 <- renderText(input$box2)
      # output$fun11 <- renderText(input$funchoice)
#unif
  output$unifPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
      set.seed(input$seed1)
      X <- runif(input$N, min = input$unif.a, max = input$unif.b)
    
      # bins <- seq(min(x), max(x), length.out = input$bins + 1)
    # draw the histogram with the specified number of bins
    hist(X, breaks = 50, col = 'darkgray', border = 'white')

  })
  
  output$unifPlot2 <- renderPlot({
        
        fun2 <- input$funchoice
        # fun2 <<- list(mean, median,sd)[[input$funchoice]]
        
        # generate bins based on input$bins from ui.R
        n <- input$sim
        
        simvar <- sapply(1:n, FUN = function(x){
            if(fun2 == 1){
                  mean( runif(input$N, min = input$unif.a, max = input$unif.b) )
            }else if(fun2 == 2){
                  median( runif(input$N, min = input$unif.a, max = input$unif.b) )
            }else if(fun2 == 3){
                  sd( runif(input$N, min = input$unif.a, max = input$unif.b) )
                  
            }
              
        })
        # draw the histogram with the specified number of bins
        hist(simvar, breaks = 50, col = 'darkgray', border = 'white', main = "Histogram of f(X)", xlab = "f(X)")
        
  })
  
  
  output$expPlot <- renderPlot({
        
        # generate bins based on input$bins from ui.R
        set.seed(input$seed2)
        X <- rexp(input$N2, rate = input$exp.lambda)
        
        # bins <- seq(min(x), max(x), length.out = input$bins + 1)
        # draw the histogram with the specified number of bins
        hist(X, breaks = 50, col = 'darkgray', border = 'white')
        
  })
  
  output$expPlot2 <- renderPlot({
        
        fun2 <- input$funchoice2
        # fun2 <<- list(mean, median,sd)[[input$funchoice]]
        
        # generate bins based on input$bins from ui.R
        n <- input$sim2
        
        simvar <- sapply(1:n, FUN = function(x){
              if(fun2 == 1){
                    mean( rexp(input$N2, rate = input$exp.lambda) )
              }else if(fun2 == 2){
                    median( rexp(input$N2, rate = input$exp.lambda) )
              }else if(fun2 == 3){
                    sd( rexp(input$N2, rate = input$exp.lambda) )
                    
              }
              
        })
        # draw the histogram with the specified number of bins
        hist(simvar, breaks = 50, col = 'darkgray', border = 'white', main = "Histogram of f(X)", xlab = "f(X)")
        
  })
  
  
})
