library(shiny)
library(shinythemes)


intro_tab <- tabPanel(
  "Introduction",
  fluidPage(
    includeMarkdown("text.md")
  )
)

chart1_tab <- tabPanel(
  "Chart 1",
  fluidPage(
    p("Chart 1 will go here.")
  )
)

chart2_tab <- tabPanel(
  "Chart 2",
  fluidPage(
    p("Chart 2 will go here.")
  )
)

chart3_tab <- tabPanel(
  "Chart 3",
  fluidPage(
    p("Chart 3 will go here.")
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