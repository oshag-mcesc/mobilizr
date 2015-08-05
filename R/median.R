#' Median computation.
#'
#' Calculate the median of a set of values. The function sets \code{na.rm = TRUE} by default and prints a warning informing users how many values were \code{NA}.
#' @inheritParams mosaic::median
#' @examples
#' median(~hp, data = mtcars)
#'

median <- function(x, data, ...) {
  if (any(is.na(mosaic::median(x = x, data = data, ...)))) {
    missing <- favstats(x = x, data = data, ...)$missing
    warning(paste("The data contains", missing, "missing values\n"))
    output <- mosaic::median(x = x, data = data, ..., na.rm = TRUE)
  } else {
    output <- mosaic::median(x = x, data = data, ...)
  }
  return(output)
}
