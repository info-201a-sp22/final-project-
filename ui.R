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

#chart1_tab <- tabPanel(
#"Chart 1",
#titlePanel("Zayna's Chart 1 Title"),
# sidebarLayout(
# sidebarPanel(
#      selectInput("select", 
#                  label = h3("This is an example Selection widget. Select a mental disorder."), 
#                  choices = list("Anxiety" = 1, "Depression" = 2, "Dementia" = 3))
#    ),
#    mainPanel(
#      h3("Magic plot title"),
#      p("Here's where Plot 1 will go.")
#    )
#  )
#)

#chart2_tab <- tabPanel(
#  "Chart 2",
#  titlePanel("Emily's Chart 2 Title"),
#  sidebarLayout(
#    sidebarPanel(
#     selectInput(
#      inputId = "Selections",
#     choices = Emily_Dataset$Country,
#    selected = NULL,
#   multiple = TRUE,
#  selectize = TRUE,
# width = NULL,
#size = NULL
#),
# mainPanel(
#   h3("Prevalence of Comorbidities Among Reported Mental Disorders"),
# p("Here's where Plot 2 will go.")
# )
# )
# )
#)

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
  #chart1_tab,
  #chart2_tab,
  chart3_tab
)