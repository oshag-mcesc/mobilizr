#' Add a fitted linear model to a plot
#'
#' Include a line or curve created from a linear model with a single response
#' and a single explanatory variable. The \code{mod} function should be created
#' by using the \code{lm} function. To plot a polynomial curve, use the
#' \code{poly} function with the explanatory variable. See the examples below
#' for additional usage details.
#'
#' @param mod. A linear model with a single response and a single explanatory
#'   variable.
#' @param col. A character color to use when plotting the line/curve.
#'
#' @seealso \code{\link{add_line}}, \code{\link{lm}}, \code{\link{poly}}
#'
#' @examples
#' # Create a linear model and use the model plot the line on a xyplot
#' m_line <- lm(weight ~ height, data = cdc)
#' xyplot(weight ~ height, data = cdc)
#' add_curve(m_line)
#'
#' # Create a linear model with a quadratic polynomial and include the curve on
#' # the xyplot.
#' m_curve <- lm(weight ~ poly(height, 2), data = cdc)
#' xyplot(weight ~ height, data = cdc)
#' add_curve(m_curve)


add_curve <- function(mod, col = "black") {
  # Determine the degree of the model (How many terms are included)
  deg = length(coef(mod)) - 1

  # Add the curve to an xyplot
  ladd(panel.curve(rowSums(
    t(coef(mod) * t(outer(x, 0:deg, "^")))), col = col))
}
