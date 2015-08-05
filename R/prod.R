#' Production computation.
#'
#' Compute the product of a set of values. The function sets \code{na.rm = TRUE} by default and prints a warning informing users how many values were \code{NA}.
#' @inheritParams mosaic::prod
#' @examples
#' prod(~hp, data = mtcars)
#'

prod <- function(x, data, ...) {
  if (any(is.na(mosaic::prod(x = x, data = data, ...)))) {
    missing <- favstats(x = x, data = data, ...)$missing
    warning(paste("The data contains", missing, "missing values\n"))
    output <- mosaic::prod(x = x, data = data, ..., na.rm = TRUE)
  } else {
    output <- mosaic::prod(x = x, data = data, ...)
  }
  return(output)
}
