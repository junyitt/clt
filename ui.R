#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Visualize Central Limit Theorem"),
  
  # Sidebar with a slider input for number of bins 
  # sidebarLayout(
    # sidebarPanel(
          # textInput("box1", "Enter Tab 1 Text:", value = "Tab 1!"),
          # textInput("box2", "Enter Tab 2 Text:", value = "Tab 2!")

               
          
          
    


            # sliderInput("bins",
            #           "Number of bins:",
            #           min = 1,
            #           max = 100,
            #           value = 30)

    # ),

    # Show a plot of the generated distribution
    mainPanel(
          
       tabsetPanel(type = "tabs",     
                   tabPanel(
                         "Uniform Distribution", 
                         fixedRow(
                               column(3, numericInput("unif.a", "Parameter, a", value = 0)
                              ),
                              column(3,
                               numericInput("unif.b", "Parameter, b", value = 1)
                              ),
                              column(6, 
                                     selectInput("funchoice", label = "Select function of X", 
                                                 choices = list("Mean" = 1, "Median" = 2,
                                                                "Standard Deviation" = 3), selected = 1)
                              )
                         ),
                             
                        fixedRow( 
                              column(2, numericInput("seed1", "Seed", value = 123)
                              ),                        
                              column(4,
                              sliderInput("N",
                                          "Sample Size:",
                                          min = 1,
                                          max = 100,
                                          value = 30)
                              ),
                              column(6, numericInput("sim", "Number of simulations:", value = 1000))
                              
                        ),
                        
                        fixedRow(
                              column(6,
                                     
                                     plotOutput("unifPlot")
                              ),
                              column(6,
                                     plotOutput("unifPlot2")  
                              )
                        )
                        ),
                         

                   tabPanel("Exponential Distribution",

                            fixedRow(
                                  column(5, numericInput("exp.lambda", "Parameter, lambda", value = 1)
                                  ),
                                  column(1,
                                         ""
                                  ),
                                  column(6,
                                         selectInput("funchoice2", label = "Select function of X",
                                                     choices = list("Mean" = 1, "Median" = 2,
                                                                    "Standard Deviation" = 3), selected = 1)
                                  )
                            ),

                            fixedRow(
                                  column(2, numericInput("seed2", "Seed", value = 123)
                                  ),
                                  column(4,
                                         sliderInput("N2",
                                                     "Sample Size:",
                                                     min = 1,
                                                     max = 100,
                                                     value = 30)
                                  ),
                                  column(6, numericInput("sim2", "Number of simulations:", value = 1000))

                            ),

                            fixedRow(
                                  column(6,

                                         plotOutput("expPlot")
                                  ),
                                  column(6,
                                         plotOutput("expPlot2")
                                  )
                            )
                  )#tab panel2
                  
       )
    )
  )
  # )
)
