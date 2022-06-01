







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

Pie_Chart <- ggplot(Yes_mental_health, aes(x="", y=count, fill= Mental_Health)) +
  geom_bar(stat="identity", width=1, color="white") +
  geom_label(aes(label = count),
             position = position_stack(vjust = 0.5),
             show.legend = FALSE) +
  coord_polar(theta = "y", start=0) +
  theme_void() +
  labs(title = 'Prevelance of Anxiety Impacting Social Functioning and Mobility', fill = "Mental Health Co-Varients") +
  scale_fill_discrete(labels = c("Difficulty Doing Errands", "Difficulty Socially Particpating", "Ever Had Anxiety"))




library(shiny)



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

 
   output$pie <- renderPlotly({
  
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
    
    
    
        
  })
  
  
}



sidebar_panel_widget <- sidebarPanel(
  selectInput(
    inputId = "Mental_Health_Co-Varients",
    label = "Select Anxiety related Mental Health Disorder",
    choices = Yes_mental_health$Mental_Health,
    selected = "dif_doing_errands", 
    multiple = FALSE
  )
)

main_panel_plot <- mainPanel(
  plotlyOutput(outputId = "pie"),
  includeMarkdown("FinalPieSum.md")
  )

awesomeCheckboxGroup(
  inputId = "Mental_Health_Co-Varients",
  label = "Checkboxes with status", 
  choices = Yes_mental_health$Mental_Health,
  inline = TRUE,
  status = "danger"
)
