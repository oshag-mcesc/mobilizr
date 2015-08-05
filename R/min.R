#' Minimum value computation.
#'
#' Compute the minimum of a set of values. The function sets \code{na.rm = TRUE} by default and prints a warning informing users how many values were \code{NA}.
#' @inheritParams mosaic::min
#' @examples
#' min(~hp, data = mtcars)
#'

min <- function(x, data, ...) {
  if(plyr::is.formula(x)) {
    if (any(is.na(mosaic::min(x = x, data = data, ...)))) {
      missing <- favstats(x = x, data = data, ...)$missing
      warning(paste("The data contains", missing, "missing values.\n"))
      output <- mosaic::min(x = x, data = data, ..., na.rm = TRUE)
    } else {
      output <- mosaic::min(x = x, data = data, ...)
    }
  } else {
    output <- base::min(x, ...)
  } 
  return(output)
}
