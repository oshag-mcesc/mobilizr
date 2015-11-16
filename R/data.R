data <- function(...) {
  args <- list(...)
  exist <- length(args)
  utils::data(...)
  if (exist != 0) {
    if (is.null(args[['package']])) {
      View(...)
    }
  }
}
