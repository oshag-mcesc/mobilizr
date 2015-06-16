#' Data viewing functions
#'
#' A set of functions to view data, altered to understand formula-style syntax. \code{head} will print the first six values of an object, \code{tail} will print the last six and \code{print} will output all values into the console up to a cut-off point.
#' @param x Formula or other object to print.
#' @param data Data frame. The data where the variables can be found.
#' @examples
#' print(~hp, data = mtcars)
#' head(~hp, data = mtcars)
#' tail(~hp, data = mtcars)
#'

print <- aggregatingFunction1(base::print)

#' @rdname print
head <- aggregatingFunction1(utils::head)

#' @rdname print
tail <- aggregatingFunction1(utils::tail)
