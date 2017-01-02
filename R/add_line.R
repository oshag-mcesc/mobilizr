#' Add a line to an \code{xyplot}
#'
#' Include a line to an \code{xyplot} by either including a slope and intercept
#' term or by clicking twice on the \emph{Plots} pane in RStudio. After creating an
#' \code{xyplot}, either run \code{add_line()} with no arguments and then click
#' on the RStudio plot plane twice to draw a line OR include arguments for
#' \code{slope} and \code{intercept} to draw a specific line.
#'
#'
#' @param intercept Numerical (optional). The intercept term for a line to plot.
#' @param slope Numerical (optional). The slope term for a line to plot.
#'
#' @seealso \code{\link{add_curve}}
#'
#' @examples
#' data(cdc)
#'
#' \dontrun{
#' # Add a line by clicking on the plot pane
#' xyplot(weight ~ height, data = cdc)
#' add_line() # Click the Plots pane twice inorder to proceed.
#' }
#'
#' # Specify a line using the slope and intercept arguments
#' xyplot(weight ~ height, data = cdc)
#' add_line(intercept = -180, slope = 165)
#'
#' @importFrom lattice trellis.focus
#' @importFrom lattice trellis.unfocus
#' @importFrom grid grid.locator
#' @export


add_line <- function(intercept, slope, units = "native") {

  # If a slope and/or intercept are missing, promp the user to click twice on
  # the plot pane.
  if (missing(intercept) | missing(slope)) {
    # Focus on the plot inorder to prompt the user for coordinates
    trellis.focus("panel", 1, 1)
    cat("Select 2 data points to draw a line through: \n\n")
    ind1_raw <- grid.locator(unit = "native")
    ind2_raw <- grid.locator(unit = "native")
    ind1 <- as.numeric(ind1_raw)
    ind2 <- as.numeric(ind2_raw)

    # Create a slope and intercept term based on the coordinates.
    m1 <- (ind2[2] - ind1[2])/(ind2[1] - ind1[1])
    b1 <- ind1[2] - m1 * ind1[1]

    # Print the equation of the line for the user
    cat("Equation of the line: \n")
    if (b1 >= 0) cat("y = ", m1, "* x +", b1)
    if (b1 < 0) cat("y = ", m1, "* x -", abs(b1))

    # Included the line in the plot
    trellis.unfocus()
    ladd(panel.abline(a=b1, b=m1), data = list(b1 = b1, m1 = m1))
  } else {

  # If both a slope AND intercept are provided, draw the requested line.
    ladd(panel.abline(a=intercept, b=slope, col = "red"),
         data = list(intercept = intercept, slope = slope))
  }
}
