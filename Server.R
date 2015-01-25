library(shiny)
library(UsingR)

#Load Galton data and find the Linear regression using the independent variable parent and dependent variable child. 
data(galton)

fit <- lm(child ~ parent, data = galton)

# Childs height is predicted with respect to every inch increase or decrease in the  parents height. 

ChildHeightPredictor <- function(parentHeight) {
        predict(fit, newdata = data.frame(parent = c(parentHeight)))
}
        
# A scatter plot which depicts the expected childs height(dotted green) compared to the fitted model(yellow) and the given parent height(blue). Also the circles depict 
# where there are is more concentration of parent - child in the given data.

PCplot <- function(parent_ht, predicted_child_ht){
        y <- galton$child
        x <- galton$parent
        freqData <- as.data.frame(table(x, y))
        names(freqData) <- c("child", "parent", "freq")
        plot(
                as.numeric(as.vector(freqData$parent)),
                as.numeric(as.vector(freqData$child)),
                pch = 21, col = "black", bg = "red",
                cex = .15 * freqData$freq,
                xlab = "parent",
                ylab = "child"
        )
        abline(fit$coeff[1],fit$coeff[2], col="yellow", lwd=3)
        abline(v=parent_ht, col="blue", lwd=2)
        abline(h=ChildHeightPredictor(parent_ht), col="green", lty=3, lwd=2)
}       
        
shinyServer(
                function(input, output) {
                        output$inputParentHeight <- renderPrint({input$parentHeight})
                        output$predictionHeight <- renderPrint({ChildHeightPredictor(input$parentHeight)})
                        output$PCplot <- renderPlot(PCplot(input$parentHeight))
                }
)                

        