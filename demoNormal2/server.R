#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
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
})
