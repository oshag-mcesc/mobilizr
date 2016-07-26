#' Print last six observations.
#'
#' \code{tail} will print the last six values of an object.
#'
#' @param x Formula or other object to print.
#' @param data Data frame. The data where the variables can be found.
#' @examples
#' head(~hp, data = mtcars)
#' tail(~hp, data = mtcars)
#'

# Allow user to use formula syntax with tail function.
tail <- mosaic::aggregatingFunction1(utils::tail)
