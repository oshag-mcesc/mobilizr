#' Variance computation
#'
#' Calculate the variance of a set of values. The function sets \code{na.rm = TRUE} by default and prints a warning informing users how many values were \code{NA}.
#' @inheritParams mosaic::var
#' @examples
#' var(~hp, data = mtcars)
#'

var <- function(x, data, ...) {
  if (any(is.na(mosaic::var(x = x, data = data, ...)))) {
    missing <- favstats(x = x, data = data, ...)$missing
    warning(paste("The data contains", missing, "missing values\n"))
    output <- mosaic::var(x = x, data = data, ..., na.rm = TRUE)
  } else {
    output <- mosaic::var(x = x, data = data, ...)
  }
  return(output)
}
