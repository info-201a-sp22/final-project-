library(ggplot2)
library(plotly)
library(dplyr)
library(tidyverse)
library(markdown)
options(scipen = 999)

# data <- read.csv("", stringsAsFactors = FALSE)
Emily_Dataset <- read.csv("Emily_SmallDataset.csv")

# final_data <-
# 
# server <- function(input, output) {
# 
#   output$plot <- renderPlotly({
# 
# 
# 
#     interactive_plot <- ggplot(data = ) +
#       geom_point(mapping = aes(x = , y = , color = )) +
#       ggtitle("")
#     return(interactive_plot)
#   })
# }

barplot <- plot_ly(just_comorbids, x = ~disorder_names, y = ~just_cp, type = 'bar', name = 'Chronic Pain') %>% 
  add_trace(y = ~just_op, name = 'Opioid Use') %>% 
  add_trace(y = ~just_sf, name = 'Social Functioning') %>% 
  add_trace(y = ~just_hy, name = 'Hypertension') %>% 
  layout(title = "Frequency of Mental Health Comorbidities in the 2020 NHIS",
         yaxis = list(title = 'Number of Respondents'),
         xaxis = list(title = 'Mental Disorder'))

server <- function(input, output) {
  output$barplot <- renderPlotly({
    input$Selections
  })
}