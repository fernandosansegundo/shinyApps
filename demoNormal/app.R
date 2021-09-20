#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Define UI for application that draws a normal curve
ui <- fluidPage(

    # Application title
    titlePanel("Demostración de Shiny"),

    # Sidebar with a slider input for mean and sd 
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
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        data <- tibble(x = rnorm(n = 10000, 
                      mean = input$media, 
                      sd = input$desvTip)) %>% 
            mutate(y = dnorm(x, mean = input$media, 
                             sd = input$desvTip))
            
        # draw the histogram with the specified number of bins
        ggplot(data) + 
            geom_point(aes(x, y)) + 
            xlim(-3, 3)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
