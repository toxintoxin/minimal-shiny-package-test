months <- c(
  "January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"
)

#' Main UI function (like in ui.R)
#' @return UI object
#' 
#' @import shiny
#' @export
uiFunction <- function() {

  function(request) {

    shinyUI(
      navbarPage(
        "Sample app",
        tabPanel("Need ggplot2",
        plotOutput("plot")
        ),
        tabPanel("Pick a month",
        selectInput("month", "What's your favourite month?", choices = months)
        ),
        tabPanel("Feedback", monthFeedbackUI("tab1")),
        tabPanel("Birthstone", birthstoneUI("tab2"))
      )
    )

  }

}


#' Main server function (like in server.R)
#' @return function that can be used as server component of a shiny app
#' 
#' @import shiny
#' @import ggplot2
#' @export
serverFunction <- function() {

  function(input, output, session) {

    output$plot <- renderPlot({
      ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
        geom_point(size = 3, alpha = 0.7)
    })
    monthFeedbackServer("tab1", reactive(input$month))
    birthstoneServer("tab2", reactive(input$month))

  }

}