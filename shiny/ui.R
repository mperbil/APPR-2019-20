library(shiny)

ui <- fluidPage(
  inputPanel(
    selectInput('x', 'X', choices = c("penaltyFaced", "savedShotsFromOutsideTheBox", "savedShotsFromInsideTheBox"),
                selected = "savedShotsFromInsideTheBox"),
    selectInput('y', 'Y', choices = c("penaltySave", "goalsConcededOutsideTheBox", "goalsConcededInsideTheBox"), 
                selected = "goalsConcededInsideTheBox"),
    selectInput('z', 'drzava', choices = unique(t2$drzava), selected = "Spain")
  ), 
  mainPanel(plotOutput("outplot")) 
)




# inputPanel(
#   selectInput('x', 'X', names(t3)),
#   selectInput('y', 'Y', names(t3))
# )




# shinyUI(fluidPage(
#   
#   titlePanel("Slovenske občine"),
#   
#   tabsetPanel(
#       tabPanel("Velikost družine",
#                DT::dataTableOutput("t1")),
#       
#       tabPanel("Število naselij",
#                sidebarPanel(
#                   uiOutput("pokrajine")
#                 ),
#                mainPanel(plotOutput("naselja")))
#     )
# ))
