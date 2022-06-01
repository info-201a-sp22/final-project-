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
  write.csv(Final_Dataset) 
  
  Final_Dataset$ever_had_anxiety[Final_Dataset$ever_had_anxiety == 1] <- "yes"
  Final_Dataset$diff_partic_social_act[Final_Dataset$diff_partic_social_act == 1] <-"yes"
  Final_Dataset$dif_doing_errands[Final_Dataset$dif_doing_errands == 2] <- "yes"
  Final_Dataset$dif_doing_errands[Final_Dataset$dif_doing_errands == 3] <- "yes"
  Final_Dataset$dif_doing_errands[Final_Dataset$dif_doing_errands == 4] <- "yes"
  Final_Dataset$dif_doing_errands[Final_Dataset$dif_doing_errands == 7] <- "yes"
  
  pivot <- Final_Dataset %>% 
    select(ever_had_anxiety, dif_doing_errands, diff_partic_social_act) %>% 
    pivot_longer(cols = ever_had_anxiety:diff_partic_social_act,
                 names_to = "Mental_Health",
                 values_to = "Severity"
    )
  
  
  Yes_mental_health <- pivot %>% 
    filter(Severity == "yes") %>% 
    group_by(Mental_Health) %>% 
    summarise(count = n())
  
  
  output$pie <- renderPlotly ({
    
    Interactive_pie_chart<- Yes_mental_health %>% 
      filter(Mental_Health == input$count) 
    
    Pie_Chart <- ggplot(Yes_mental_health, aes(x="", y=count, fill= Mental_Health)) +
      geom_bar(stat="identity", width=1, color="white") +
      geom_label(aes(label = count),
                 position = position_stack(vjust = 0.5),
                 show.legend = FALSE) +
      coord_polar(theta = "y", start=0) +
      theme_void() +
      labs(title = 'Prevelance of Anxiety Impacting Social Functioning and Mobility', fill = "Mental Health Co-Varients") +
      scale_fill_discrete(labels = c("Difficulty Doing Errands", "Difficulty Socially Particpating", "Ever Had Anxiety"))
    
  return(Pie_Chart)   
 
  
  
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
