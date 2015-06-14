#' Standard deviation computation
#'
#' Calculate the standard deviation of a set of values. The function sets \code{na.rm = TRUE} by default and prints a warning informing users how many values were \code{NA}.
#' @inheritParams mosaic::sd
#' @examples
#' stdev(~hp, data = mtcars)
#'

stdev <- function(x, data, ...) {
  if (any(is.na(mosaic::sd(x = x, data = data, ...)))) {
    missing <- favstats(x = x, data = data, ...)$missing
    warning(paste("The data contains", missing, "missing values\n"))
    output <- mosaic::sd(x = x, data = data, ..., na.rm = TRUE)
  } else {
    output <- mosaic::sd(x = x, data = data, ...)
  }
  return(output)
}
