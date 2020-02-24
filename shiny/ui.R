library(shiny)

ui <- fluidPage(
  inputPanel(
    selectInput('x', 'X', choices = c("Enajstmetrovke" = "penaltyFaced", "Obranjeni streli izven kazenskega prostora" = "savedShotsFromOutsideTheBox", "Obranjeni streli znotraj kazenskega prostora" =  "savedShotsFromInsideTheBox"),
                selected = "savedShotsFromInsideTheBox"),
    selectInput('y', 'Y', choices = c("Obranjene enajstmetrovke" = "penaltySave","Prejeti zadetki izven kazenskega prostora" = "goalsConcededOutsideTheBox","Prejeti zadetki znotraj kazenskega prostora" = "goalsConcededInsideTheBox"), 
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
