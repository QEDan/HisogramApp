library(shiny)
data(mtcars)
mtcars$am <- as.factor(mtcars$am)
levels(mtcars$am) <- c("Automatic", "Manual")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    rowFilter <- logical(length = nrow(mtcars))
    rowFilter <- TRUE
    if(input$am != "Both") rowFilter <- rowFilter & mtcars$am == input$am
    rowFilter <- rowFilter & mtcars$wt < input$maxwt/1000.0
    rowFilter <- rowFilter & mtcars$qsec < input$maxqsec
    x    <- mtcars[rowFilter, ]$mpg
    mean.x <- mean(x)
    
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = 10, col = 'black', 
         border = 'white', xlab="Mileage (MPG)",
         main = "Mileage Histogram")
    lines(c(mean.x, mean.x), c(0, 200), col="red", lwd=5)
  })
})
