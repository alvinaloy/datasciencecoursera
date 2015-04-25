library(shiny)

shinyUI(fluidPage(
        
        titlePanel("Vehicle MPG Prediction Using Motor Trend Dataset"),
        sidebarLayout(
                sidebarPanel(
                        p("This is a regression model based on user's selection."),
                        p("Modify controls below as desired."),
                        br(),
                        sliderInput("cyl", "Number of engine cylinders", min = 4, max = 8, value = 6),
                        
                        sliderInput("wt", "Weight of car (in 1000's)?", min = 1, max = 6, value = 4),
                        br(),
                        textOutput("predicted_mpg")
                ),
                mainPanel(
                        plotOutput("graph_mpg")
                )
        )
))