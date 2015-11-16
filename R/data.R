data <- function(...) {
  args <- list(...)
  exist <- length(args)
  if (exist != 0) {
    if (is.null(args[['package']])) {
      View(...)
    }
  }
  utils::data(...)
}
