library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Motor Trend Road Test Mileage"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "am",
                  label = "Choose the transmission type:",
                  choices = c("Both", "Manual", "Automatic")),
      sliderInput(inputId = "maxwt",
                  label = "Choose the maximum vehicle weight (lbs):",
                  min = 1600, max = 5500, value=5500),
      sliderInput(inputId = "maxqsec",
                  label = "Choose the maximum quarter-mile time (seconds):",
                  min = 15, max = 23, value=23)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      p("This app plots a histogram of mileages for cars from the 1974 Motor Trend data set."),
      p("\n"),
      p("You can filter the cars by transmission type and vehicle weight and see the resulting distribution of mileages. To use the app, simply make your selections using the drop boxes and sliders provided."),
      p("\n"),
      p("The red line shows the mean of the displayed distribution."),
      plotOutput("distPlot")
    )
  )
))
