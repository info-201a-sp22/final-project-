library(shiny)
library(shinythemes)


intro_tab <- tabPanel(
  "Introduction",
  fluidPage(
    includeMarkdown("text.md")
  )
)

chart1_tab

chart2_tab

chart3_tab


ui <- navbarPage(
  "2020 NIHS Data",
  theme = shinytheme("flatly"),
  chart1_tab,
  chart2_tab,
  chart3_tab
)