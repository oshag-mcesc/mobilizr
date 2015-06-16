#' View first/last observations.
#'
#' A pair of functions, altered to understand formula-style syntax. \code{head} will print the first six values of an object, \code{tail} will print the last six.
#' @param x Formula or other object to print.
#' @param data Data frame. The data where the variables can be found.
#' @examples
#' head(~hp, data = mtcars)
#' tail(~hp, data = mtcars)
#'

head <- mosaic::aggregatingFunction1(utils::head)

#' @rdname head
tail <- mosaic::aggregatingFunction1(utils::tail)
