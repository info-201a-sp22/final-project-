library(shiny)
library(shinythemes)
library(markdown)
library(bslib) 
library(htmlwidgets) 
library(DT)
library(plotly) 
library(ggplot2) 
library(dplyr)
library(hrbrthemes)
library(scales)
library(viridis)
library(viridisLite)
options(scipen = 999)

zdata <- read.csv("zchart.csv")
chart2 <- read.csv("emchart.csv")
chart3 <- read.csv("chart3.csv")

Z_variable <- c("Difficulty Doing Errands", "Difficulty Socially Particpating", "Ever Had Anxiety")

server <- function(input, output) {

  output$pie <- renderPlotly({
    
    interactive_pie_chart <- zdata %>%
      filter(Mental_Health %in% input$Mental_Health_Co_Variants) 
    
Pie_Chart <- plot_ly(zdata, labels = ~Z_variable, values = ~count, type = 'pie')
Pie_Chart <- Pie_Chart %>% layout (title = 'Prevelance of Anxiety Impacting Social Functioning and Mobility',
xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))


     return(Pie_Chart)   
  
  })
  
  output$plot2 <- renderPlotly({
    
    comorbid_widget <- chart2 %>% 
       filter(disorder_names %in% input$comorbid_selection)
     
    emplot <- plot_ly(comorbid_widget, x = ~disorder_names, y = ~just_cp, type = 'bar', name = 'High Chronic Pain') %>% 
      add_trace(y = ~just_op, name = 'Opioid Use') %>%
      add_trace(y = ~just_sf, name = 'Difficulty with Social Functioning') %>%
      add_trace(y = ~just_hy, name = 'Hypertension') %>%
      layout(title = "Frequency of Mental Health Comorbidities in the 2020 NHIS",
             yaxis = list(title = 'Number of Respondents'),
             xaxis = list(title = 'Mental Disorder'))
    return(emplot)
    
  })
  
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


