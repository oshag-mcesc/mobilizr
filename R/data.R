data <- function(...) {
  utils::data(...)
  if (!missing(package)) {
    View(...)
  }
}