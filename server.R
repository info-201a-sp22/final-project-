library(ggplot2)
library(plotly)
library(dplyr)
library(tidyverse)
library(markdown)
library(shiny)
options(scipen = 999)

# data <- read.csv("", stringsAsFactors = FALSE)
Emily_Dataset <- read.csv("Emily_SmallDataset.csv")

server <- function(input, output) {
 
  #barplot <- plot_ly(just_comorbids, x = ~disorder_names, y = ~just_cp, type = 'bar', name = 'Chronic Pain') %>% 
  #add_trace(y = ~just_op, name = 'Opioid Use') %>% 
  #add_trace(y = ~just_sf, name = 'Social Functioning') %>% 
  #add_trace(y = ~just_hy, name = 'Hypertension') %>% 
  #layout(title = "Frequency of Mental Health Comorbidities in the 2020 NHIS",
  #yaxis = list(title = 'Number of Respondents'),
  #xaxis = list(title = 'Mental Disorder'))
   
  output$plot3 <- renderPlotly({
    
    filtered_main <- chart3 %>% 
      filter(input$year_selection[1] <=Year & input$year_selection[2] >=Year)
    
    samplot <- filtered_main %>%
      ggplot( aes(x=Year, y=Rate, group=Disorder, color=Disorder)) +
      geom_line() +
      scale_color_viridis(discrete = TRUE) +
      ggtitle("US Mental Health Disorder Prevalence") +
      theme_ipsum() +
      ylab("Population Occurrence Rate") 
    return(samplot)
  })
}
