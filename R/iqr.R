#' IQR computation.
#'
#' Calculate the IQR of a set of values. The function sets \code{na.rm = TRUE} by default and prints a warning informing users how many values were \code{NA}.
#' @inheritParams mosaic::iqr
#' @examples
#' iqr(~hp, data = mtcars)
#' IQR(~hp, data = mtcars)
#'

iqr <- function(...) {
  output <- tryCatch(mosaic::iqr(...), error=function(e) mosaic::iqr(..., na.rm=TRUE));
  missing <- mosaic::favstats(...)$missing;
  warning(paste("The data contains", missing, "missing values\n"))
  return(output)
}

#' @rdname iqr
IQR <- function(...) {
  output <- tryCatch(mosaic::iqr(...), error=function(e) mosaic::iqr(..., na.rm=TRUE));
  missing <- mosaic::favstats(...)$missing;
  warning(paste("The data contains", missing, "missing values\n"))
  return(output)
}
