#' Summation computation.
#'
#' Compute the summation of a set of values. The function sets \code{na.rm = TRUE} by default and prints a warning informing users how many values were \code{NA}.
#' @inheritParams mosaic::sum
#' @examples
#' sum(~hp, data = mtcars)
#'

sum <- function(x, data, ...) {
  if (any(is.na(mosaic::sum(x = x, data = data, ...)))) {
    missing <- favstats(x = x, data = data, ...)$missing
    warning(paste("The data contains", missing, "missing values\n"))
    output <- mosaic::sum(x = x, data = data, ..., na.rm = TRUE)
  } else {
    output <- mosaic::sum(x = x, data = data, ...)
  }
  return(output)
}
