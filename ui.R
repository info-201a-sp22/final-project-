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

Z_variable <- c("Difficulty Doing Errands", "Difficulty Socially Particpating", "Ever Had Anxiety")
zdata <- read.csv("zchart.csv")
chart2 <- read.csv("emchart.csv")
chart3 <- read.csv("chart3.csv")

#vector for sams slider
sam_min_year <- 2016
sam_max_year <- 2020

#Primary panel
intro_tab <- tabPanel(
  "Introduction",
  fluidPage(
  includeMarkdown("text.md")
  )
)

#Zayna's widget
z_widget <- sidebarPanel(
  selectInput(
    inputId = "Mental_Health_Co_Variants",
    label = "Select Anxiety-Related Mental Co-Variant",
    choices = c("Difficulty Doing Errands" = "dif_doing_errands",
       "Difficulty Socially Particpating" = "diff_partic_social_act",
       "Ever Had Anxiety" = "ever_had_anxiety"),
     multiple = TRUE
  )
)

#Em's widget
em_widget <- sidebarPanel(
  selectInput(inputId = "comorbid_selection",
               label = h3("Select mental health disorders"),
               choices = c(chart2$disorder_names),
               selected = "Anxiety",
               multiple = TRUE,
               selectize = TRUE,
               width = NULL,
               size = NULL)
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



#The contents of Em's tab
em_panel_plot <- mainPanel(
  plotlyOutput(outputId = "plot2"),
  includeMarkdown("emtext.md")
)

#The contents of sams tab
sam_panel_plot <- mainPanel(
  plotlyOutput(outputId = "plot3") ,
  includeMarkdown("sam_chart_summary.md")
)

z_panel_plot <- mainPanel(
  plotlyOutput(outputId = "pie"),
  includeMarkdown("FinalPieSum.md")
 )


#formatting/compiling all Z's things into Z's tab
chart1_tab <- tabPanel(
  "Anxiety's Impact on Social Functioning and Mobility",
  fluidPage(
    sidebarLayout(
      z_widget,
      z_panel_plot
    )
  )
)

#formatting/compiling all Em's things into Em's tab
chart2_tab <- tabPanel(
   "Comorbidity Frequencies",
   fluidPage(
     sidebarLayout(
       em_widget,
       em_panel_plot
     )
   )
 )

#formatting/compiling all my things into my tab
chart3_tab <- tabPanel(
  "Annual Prevalence",
  fluidPage(
    theme = bs_theme(version = 5 , bootswatch = "lux" , bg = "#101010", fg = "#FDF7F7", primary = "#ED79F9") ,
    sidebarLayout(
      sam_widget,
      sam_panel_plot
    )
  )
)

#Conclusion
conclusion_tab <- tabPanel(
  "Conclusion",
  fluidPage(
    includeMarkdown("conclusion.Rmd"))
)


ui <- navbarPage(
  "2020 NIHS Data",
  theme = shinytheme("flatly"),
  intro_tab,
  chart1_tab,
  chart2_tab,
  chart3_tab,
  conclusion_tab
)
