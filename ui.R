library(shiny)
library(shinythemes)
library(markdown)
library(bslib) 
library(htmlwidgets) 
library(DT)
library(plotly) 
library(ggplot2) 
library(dplyr)

Emily_Dataset <- read.csv("Emily_SmallDataset.csv")
chart3 <- read.csv("chart3.csv")
zchart <- read.csv("zchart.csv")

#vector for sams slider
sam_min_year <- 2016
sam_max_year <- 2020

#Primary panel
intro_tab <- tabPanel(
  "Introduction",
  #Include stuff below when text file is finished
  #fluidPage(
  #includeMarkdown("text.md")
  #)
)

#My widget is here, you guys should put yours right above mine for formatting
sam_widget <- sidebarPanel(
  sliderInput(inputId = "year_selection", 
              label = h3("Choose Year") ,
              min = sam_min_year , 
              max = sam_max_year ,
              sep = "", 
              value = c(sam_min_year, sam_max_year)
  )
)

sidebar_panel_widget <- sidebarPanel(
  selectInput(
    inputId = "Mental_Health_Co-Varients",
    label = "Select Anxiety related Mental Health Disorder",
    choices = zchart$Mental_Health,
    selected = "dif_doing_errands", 
    multiple = FALSE
  )
)

main_panel_plot <- mainPanel(
  plotlyOutput(outputId = "pie"),
  includeMarkdown("FinalPieSum.md")
)


Zayna_Piegraph_Tab <- tabPanel(
  "Prevalance of Anxiety Impacting Social Functioning and Mobility",
  sidebarLayout(
    sidebar_panel_widget,
    main_panel_plot
    
  )
)

#The contents of my tab
sam_panel_plot <- mainPanel(
  plotlyOutput(outputId = "plot3") ,
  paste("Provide description of plot here")
)

#formatting/compiling all my things into my tab
chart3_tab <- tabPanel(
  "Annual Prevalence",
  fluidPage(
    theme = bs_theme(version = 4 , bootswatch = "lux") ,
    sidebarLayout(
      sam_widget,
      sam_panel_plot
    )
  )
)

ui <- navbarPage(
  "2020 NIHS Data",
  theme = shinytheme("flatly"),
  intro_tab,
  Zayna_Piegraph_Tab,
  #chart2_tab,
  chart3_tab
)