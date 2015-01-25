library(shiny)

shinyUI(
        pageWithSidebar(
                # Application title
                headerPanel("Child Height Prediction"),
                sidebarPanel(
                        numericInput('parentHeight', 'ParentHeight in Inches', 70, min = 48, max = 84, step = 1),
                        submitButton('Submit')
                ),
                mainPanel(
                        h3('Results of prediction'),
                        h4('You entered parent height in Inches'),
                        verbatimTextOutput("inputParentHeight"),
                        h4('Predicted Child height in Inches '),
                        verbatimTextOutput("predictionHeight"),
                        plotOutput('PCplot')
                )
        )
)