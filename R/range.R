#' Range values computation.
#'
#' Compute the range, both the maximum and minimum values, of a set of values. The function sets \code{na.rm = TRUE} by default and prints a warning informing users how many values were \code{NA}.
#' @inheritParams mosaic::range
#' @examples
#' range(~hp, data = mtcars)
#'

range <- function(x, data, ...) {
  if (any(is.na(mosaic::range(x = x, data = data, ...)))) {
    missing <- favstats(x = x, data = data, ...)$missing
    warning(paste("The data contains", missing, "missing values\n"))
    output <- mosaic::range(x = x, data = data, ..., na.rm = TRUE)
  } else {
    output <- mosaic::range(x = x, data = data, ...)
  }
  return(output)
}
