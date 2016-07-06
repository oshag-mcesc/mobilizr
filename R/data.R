#' Load built-in data sets.
#'
#' Load built-in data sets. After loading the data, the data frame will popup in
#' an RStudio window to view.
#'
#' @param ... The data set to load.
#'
#' @return Loads the data set and opens it up to view.
#'
#' @examples
#' data(cdc)

data <- function(...) {

  # Inorder to avoid some recurring errors, we check to see whether the call
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
