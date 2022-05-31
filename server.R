library(ggplot2)
library(plotly)
library(dplyr)
library(tidyverse)
library(markdown)
options(scipen = 999)

data <- read.csv("", stringsAsFactors = FALSE)
Emily_Dataset <- read.csv("Emily_SmallDataset.csv")

final_data <- 

server <- function(input, output) {
  
  output$plot <- renderPlotly({
    
  groupedbar <- Emily_Dataset %>% 
    filter(Country %in% input$Selections)
  
    interactive_plot <- ggplot(data = ) +
      geom_point(mapping = aes(x = , y = , color = )) +
      ggtitle("")
    return(interactive_plot)
  })
}