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
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("media",
                        "Media:",
                        min = -2.5,
                        max = 2.5,
                        step = 0.1,
                        value = 0),
            sliderInput("desvTip",
                        "Desviación típica:",
                        min = 0.1,
                        max = 2,
                        step = 0.1,
                        value = 1)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
