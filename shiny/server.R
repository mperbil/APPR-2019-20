library(shiny)

server <- function(input, output) {
  
  output$outplot <- renderPlot({
    t2 %>%
      filter(drzava == input$z) %>%
      ggplot(aes_string(x=input$x, y=input$y)) + geom_point() + geom_text(aes(label=igralec),hjust=0, vjust=0, size=3) + xlab("") + ylab("")
  })
}





# shinyServer(function(input, output) {
#   output$druzine <- DT::renderDataTable({
#     druzine %>% spread(key="velikost.druzine", value="stevilo.druzin") %>%
#       rename(`Občina`=obcina)
#   })
#   
#   output$pokrajine <- renderUI(
#     selectInput("pokrajina", label="Izberi pokrajino",
#                 choices=c("Vse", levels(obcine$pokrajina)))
#   )
#   output$naselja <- renderPlot({
#     main <- "Pogostost števila naselij"
#     if (!is.null(input$pokrajina) && input$pokrajina %in% levels(obcine$pokrajina)) {
#       t <- obcine %>% filter(pokrajina == input$pokrajina)
#       main <- paste(main, "v regiji", input$pokrajina)
#     } else {
#       t <- obcine
#     }
#     ggplot(t, aes(x=naselja)) + geom_histogram() +
#       ggtitle(main) + xlab("Število naselij") + ylab("Število občin")
#   })
# })