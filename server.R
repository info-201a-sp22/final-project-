library(ggplot2)
library(plotly)
library(dplyr)
library(tidyverse)
library(markdown)
library(shiny)
options(scipen = 999)

Emily_Dataset <- read.csv("Emily_SmallDataset.csv")
zchart <- read.csv("zchart.csv")

  output$pie <- renderPlotly ({
    
    Interactive_pie_chart<- zchart %>% 
      filter(Mental_Health == input$count) 
    
    Pie_Chart <- ggplot(zchart, aes(x="", y=count, fill= Mental_Health)) +
      geom_bar(stat="identity", width=1, color="white") +
      geom_label(aes(label = count),
                 position = position_stack(vjust = 0.5),
                 show.legend = FALSE) +
      coord_polar(theta = "y", start=0) +
      theme_void() +
      labs(title = 'Prevelance of Anxiety Impacting Social Functioning and Mobility', fill = "Mental Health Co-Varients") +
      scale_fill_discrete(labels = c("Difficulty Doing Errands", "Difficulty Socially Particpating", "Ever Had Anxiety"))
    return(Pie_Chart)   
  )
   
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
