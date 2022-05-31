library(shiny)
library(shinythemes)
library(markdown)

Emily_Dataset <- read.csv("Emily_SmallDataset.csv")

intro_tab <- tabPanel(
  "Introduction",
  fluidPage(
    includeMarkdown("text.md")
  )
)

chart1_tab <- tabPanel(
  "Chart 1",
  titlePanel("Zayna's Chart 1 Title"),
  sidebarLayout(
    sidebarPanel(
      selectInput("select",
                  label = h3("This is an example Selection widget. Select a mental disorder."),
                  choices = list("Anxiety" = 1, "Depression" = 2, "Dementia" = 3))
    ),
    mainPanel(
      h3("Magic plot title"),
      p("Here's where Plot 1 will go.")
    )
  )
)

chart2_tab <- tabPanel(
  "Chart 2",
  titlePanel("Prevalence of Comorbidities Among Reported Mental Disorders"),
    sidebarLayout(
      sidebarPanel(
        selectInput(
          inputId = "Selections",
          label = "Selections",
          choices = Emily_Dataset$Country,
          selected = NULL,
          multiple = TRUE,
          selectize = TRUE
      ),
    mainPanel(
      h3("Prevalence of Comorbidities Among Reported Mental Disorders"),
      plotOutput("barplot")
      )
    )
  )
)

chart3_tab <- tabPanel(
  "Chart 3",
  titlePanel("Sam's Chart 3 Title"),
  sidebarLayout(
    sidebarPanel(
      selectInput("select",
                  label = h3("This is an example Selection widget. Select a mental disorder."),
                  choices = list("Anxiety" = 1, "Depression" = 2, "Dementia" = 3))
    ),
    mainPanel(
      h3("Magic plot title"),
      p("Here's where Plot 3 will go.")
    )
  )
)

ui <- navbarPage(
  "2020 NIHS Data",
  theme = shinytheme("flatly"),
  intro_tab,
  chart1_tab,
  chart2_tab,
  chart3_tab
)