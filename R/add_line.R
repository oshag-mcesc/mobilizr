add_line <- function(intercept, slope, units = "native") {
  if (missing(intercept) | missing(slope)) {
    trellis.focus("panel", 1, 1)
    cat("Select 2 data points to draw a line through: \n\n")
    ind1_raw <- grid.locator(unit = "native")
    ind2_raw <- grid.locator(unit = "native")
    ind1 <- as.numeric(ind1_raw)
    ind2 <- as.numeric(ind2_raw)
    m1 <- (ind2[2] - ind1[2])/(ind2[1] - ind1[1])
    b1 <- ind1[2] - m1 * ind1[1]
    cat("Equation of the line: \n")
    if (b1 >= 0) cat("y = ", m1, "* x +", b1)
    if (b1 < 0) cat("y = ", m1, "* x -", abs(b1))
    trellis.unfocus()
    ladd(panel.abline(a=b1, b=m1))
  } else {
    ladd(panel.abline(a=intercept, b=slope, col = "red"))
  }
}

add_curve <- function(mod, col = "black") {
  deg = length(coef(mod)) - 1
  ladd(panel.curve(rowSums(
    t(coef(mod) * t(outer(x, 0:deg, "^")))), col = col))
}
