library(shiny)

ui <- fluidPage(
  titlePanel("Obrambe vratarjev"),
  inputPanel(
    selectInput('x', 'X', choices = c("Enajstmetrovke" = "penaltyFaced", "Obranjeni streli izven kazenskega prostora" = "savedShotsFromOutsideTheBox", "Obranjeni streli znotraj kazenskega prostora" =  "savedShotsFromInsideTheBox"),
                selected = "savedShotsFromInsideTheBox"),
    selectInput('y', 'Y', choices = c("Obranjene enajstmetrovke" = "penaltySave","Prejeti zadetki izven kazenskega prostora" = "goalsConcededOutsideTheBox","Prejeti zadetki znotraj kazenskega prostora" = "goalsConcededInsideTheBox"), 
                selected = "goalsConcededInsideTheBox"),
    selectInput('z', 'država', choices = unique(t2$drzava), selected = "Spain")
  ), 
  mainPanel(plotOutput("outplot")) 
)








# shinyUI(fluidPage(
#   
#   titlePanel("Slovenske obÄŤine"),
#   
#   tabsetPanel(
#       tabPanel("Velikost druĹľine",
#                DT::dataTableOutput("t1")),
#       
#       tabPanel("Ĺ tevilo naselij",
#                sidebarPanel(
#                   uiOutput("pokrajine")
#                 ),
#                mainPanel(plotOutput("naselja")))
#     )
# ))
