#' Load built-in datasets.
#'
#' Load built-in data sets. After loading the data, the data frame will popup in
#' an RStudio window to view.
#'
#' @param ... The name of the dataset to load.
#'
#' @return Loads the dataset and opens it up to view.
#'
#' @examples
#' data(cdc)

data <- function(...) {

  # In order to avoid some recurring errors, we check to see whether the call
  # should or should not open the View() window.
  args <- list(...)
  exist <- length(args)
  if (exist != 0) {
    if (is.null(args[['package']])) {
      View(...)
    }
  }
  utils::data(...)
}
