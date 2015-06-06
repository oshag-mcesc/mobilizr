#' Bargraph Plots
#'
#' Create a bargraph.
#'
#' @param x \code{formula}. An expression of the form \code{~ x | z} where \code{x} is the variable we want to make bargraphs for and \code{z} is a second, optional, variable we would like to use for faceting.
#' @param data data frame. The data where the variables can be found.
#' @param groups factor. An additional variable to use for side-by-side bargraphs.
#' @param horizontal logical. Use \code{horizontal = TRUE} to make a horizontal bargraph.
#' @section Note:
#' For additional options for creating bargraphs, look at the help file found in the \code{mosaic} package or run \code{help(bargraph, package="mosaic")} in the console.
#' @examples
#' data(cdc)
#' bargraph(~depressed, data = cdc)
#' bargraph(~depressed, data = cdc, groups = gender)
#' bargraph(~depressed | grade, data = cdc, groups = gender)

bargraph <- function (x, data = parent.frame(), groups, horizontal = FALSE,
                      origin = 0, ylab = ifelse(horizontal, "", "Frequency"), xlab = ifelse(horizontal, "Frequency", ""), subset, ...)
{
  haveGroups <- !missing(groups)
  sgroups <- substitute(groups)
  formula <- paste("~", deparse(mosaic::rhs(x)))
  if (!is.null(mosaic::condition(x)))
    formula <- paste(formula, "+", deparse(mosaic::condition(x)))
  if (haveGroups)
    formula <- paste(formula, "+", sgroups)
  formula <- as.formula(formula)
  if (missing(subset)) {
    xtab <- as.data.frame(xtabs(formula, data = data))
  }
  else {
    xtab <- as.data.frame(do.call(xtabs, list(formula, data = data,
                                              subset = substitute(subset))))
  }
  lastvar = names(xtab)[ncol(xtab)]
  if (horizontal) {
    if (!is.null(mosaic::condition(x))) {
      formula <- as.formula(paste(deparse(mosaic::rhs(x)), " ~ ",
                                  lastvar, " | ", deparse(mosaic::condition(x))))
    }
    else {
      formula <- as.formula(paste(deparse(mosaic::rhs(x)), " ~ ",
                                  lastvar))
    }
  }
  else {
    if (!is.null(mosaic::condition(x))) {
      formula <- as.formula(paste(lastvar, " ~", deparse(mosaic::rhs(x)),
                                  "|", deparse(mosaic::condition(x))))
    }
    else {
      formula <- as.formula(paste(lastvar, " ~", deparse(mosaic::rhs(x))))
    }
  }
  if (haveGroups)
    lattice::barchart(formula, data = xtab, groups = eval(sgroups), auto.key = TRUE,
             origin = origin, ylab = ylab, xlab = xlab, ...)
  else lattice::barchart(formula, data = xtab, origin = origin, ylab = ylab,
                xlab = xlab, ...)
}
