#' The application server-side
#' @return function that can be used as server component of a shiny app
#' 
#' @import shiny
#' @import ggplot2
app_server <- function(input, output, session) {

  sidebar_link_ids <- c(
    "ttest",
    "pie", "bar", "volcano", "nightingale",

    "data_preprocessing",

    "formula_handle",
    "tf",

    "md5_check"
  )

  # shinyjs::onclick("homepage", {
  #   # 执行与 observeEvent 类似的逻辑
  #   freezeReactiveValue(input, "tabs")
  #   updateTabsetPanel(session, inputId = "tabs", selected = "homepage")
  # })

  # add observers to switch to the clicked link's tab:
  lapply(sidebar_link_ids, \(id) {
    observeEvent(input[[id]], {
      freezeReactiveValue(input, "tabs")
      updateTabsetPanel(session = session, inputId = "tabs", selected = id)
    })
  })

  tfServer("tf")
print(big_data)
}
