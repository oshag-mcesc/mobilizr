#' Histogram Plots
#'
#' Create a histogram of single variables.
#'
#' @param x \code{formula}. An expression of the form \code{~ x | z} where \code{x} is the variable we want to make histograms for and \code{z} is a second, optional, variable we would like to use for faceting.
#' @param data data frame. The data where the variables can be found.
#' @param type character. A character string that describes what units the user would like on the y-axis. Options include \code{"count"} for frequencies, \code{"percent"} for percentages and \code{"density"} which can be used when adding fitted lines.
#' @param nint number. The number of bins to use in the histogram
#' @param fit character. A character string that describes a probablility density curve to overlay on the histogram of the data. Distributions that can be used are \code{"normal"}, \code{"beta"}, \code{"cauchy"}, \code{"chisq"} (similarly \code{"chi-squared"}), \code{"exponential"}, \code{"gamma"}, \code{"geometric"}, \code{"lognormal"}, \code{"poisson"}, \code{"t"} and \code{"weibull"}
#' @section Note:
#' For additional options for creating histogram, look at the help file found in the \code{lattice} package or run \code{help(histogram, package="lattice")} in the console.
#' @examples
#' data(cdc)
#' histogram(~height, data = cdc)
#' histogram(~height, data = cdc, fit = "normal")
#' histogram(~height | gender, data = cdc)
#'
#' @export

histogram <- function(x, data, type = 'count', fit, ...) {
  # Change default y-axis to "count"

  # If including a fitted density curve, change y-axis back to "density"
  if(!missing(fit)) {
    lattice::histogram(x = x, data = data, type = 'density', fit = fit, ...)
  } else {
    lattice::histogram(x = x, data = data, type = type, ...)
  }
}
