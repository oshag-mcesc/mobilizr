#' Box and Whisker Plot
#'
#' Create a box and whisker plot.
#'
#' @param x \code{formula}. An expression of the form \code{~ x | z} where \code{x} is the variable we want to make boxplots for and \code{z} is a second, optional, variable we would like to use for faceting. Alternatively, one could also use the form \code{z ~ x} or \code{x ~ z} to change how the faceted boxplot is displayed.
#' @param data data frame. The data where the variables can be found.
#' @examples
#' data(cdc)
#' bargraph(~height, data = cdc)
#' bargraph(~height | gender, data = cdc)
#' bargraph(gender ~ height, data = cdc)
#' bargraph(height ~ gender, data = cdc)

bwplot <- function(x, data, ...) {
    lattice::bwplot(x = x, data = data, ..., panel = function (x, ...) {
        panel.bwplot(x, pch = "|", ...)
    })
}
