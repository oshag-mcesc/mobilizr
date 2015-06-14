#' Maximum value computation
#'
#' Compute the maxiumum of a set of values. The function sets \code{na.rm = TRUE} by default and prints a warning informing users how many values were \code{NA}.
#' @inheritParams mosaic::max
#' @examples
#' max(~hp, data = mtcars)
#'

max <- function(x, data, ...) {
  if (any(is.na(mosaic::max(x = x, data = data, ...)))) {
    missing <- favstats(x = x, data = data, ...)$missing
    warning(paste("The data contains", missing, "missing values\n"))
    output <- mosaic::max(x = x, data = data, ..., na.rm = TRUE)
  } else {
    output <- mosaic::max(x = x, data = data, ...)
  }
  return(output)
}
