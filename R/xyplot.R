#' Scatter Plots
#'
#' Create a scatter plot.
#'
#' @param x \code{formula}. An expression of the form \code{y ~ x | z} where \code{x} is the variable we want on the x-axis, \code{y} is the variable we want on the y-axis and \code{z} is an optional variable we would like to use for faceting.
#' @param data data frame. The data where the variables can be found.
#' @param groups factor. An additional variable to use for coloring the individual points in the plot.
#' @section Note:
#' For additional options for creating bargraphs, look at the help file found in the \code{lattice} package or run \code{help(xyplot, package="lattice")} in the console.
#' @examples
#' data(cdc)
#' xyplot(weight~height, data = cdc)
#' xyplot(weight ~ height | gender, data = cdc)
#' xyplot(weight ~ height, data = cdc, groups = gender)
#'
#' @export

xyplot <- function(x, data, ...) {
  lattice::xyplot(x = x, data = data, auto.key = TRUE, ...)
}
