#' Box and Whisker Plot
#'
#' Create a box and whisker plot for a numerical variable.
#'
#' @param x Formula. An expression of the form \code{~ x | z} where \code{x} is
#'   the variable we want to make boxplots for and \code{z} is a second,
#'   optional, variable we would like to use for faceting. Alternatively, one
#'   could also use the form \code{z ~ x} or \code{x ~ z} to change how the
#'   faceted boxplot is displayed.
#' @param data Data frame. The data where the variables can be found.
#'
#' @examples
#' data(cdc)
#' bwplot(~height, data = cdc)
#' bwplot(~height | gender, data = cdc)
#' bwplot(gender ~ height, data = cdc)
#' bwplot(height ~ gender, data = cdc)
#'
#' @export

bwplot <- function(x, data, ...) {
  # Change the midpoint symbol from a dot to a line
  lattice::bwplot(x = x, data = data, ..., panel = function(x, ...) {
    lattice::panel.bwplot(x, pch = "|", ...)
  })
}
