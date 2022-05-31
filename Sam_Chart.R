library(hrbrthemes) 
library(viridis) 
library(dplyr) 
library(tidyverse) 
library(ggplot2) 
library(stringr) 
library(plotly)
library(markdown)
library(shiny)
options(scipen = 999)

chart3 <- read.csv("chart3.csv")

#Server
output$plot3 <- renderPlotly({
  
  filtered_main <- chart3 %>% 
    filter(input$year_selection[1]<=year & input$year_selection[2]>=year)
  
  chart3 %>%
    ggplot( aes(x=Year, y=Rate, group=Disorder, color=Disorder)) +
    geom_line() +
    scale_color_viridis(discrete = TRUE) +
    ggtitle("US Mental Health Disorder Prevalence") +
    theme_ipsum() +
    ylab("Population Occurrence Rate") 
  
  return(interactive_plot)
})


#ui
chart3_slider <- sliderinput(inputId = "year_selection", 
                             label = h3("Choose Year") ,
                             min = min(chart3$year) , 
                             max = max(chart3$year) ,
                             sep = "", 
                             value = 2020
                             )
#Then configure side panel widgets 