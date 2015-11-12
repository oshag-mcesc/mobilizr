#' Numerical Summary Functions
#'
#' A set of functions to calculate numerical summaries. The functions set \code{na.rm = TRUE} by default and will print a warning when data contains missing values, (\code{NA}s).
#' @param x A vector of values or a formula. Formulas should be of the form \code{~ x | z} where \code{x} is a numeric variable and \code{z} is a categorical variable. If a formula is supplied, the \code{data} argument must also be supplied.
#' @param data A data set where variables supplied to the formula, \code{~ x | z}, can be found.
#' @examples
#' data(cdc)
#' mean(1:10)
#' mean(~height, data = cdc)
#' mean(~height | gender, data = cdc)
#' MAD(1:10)
#' MAD(~height, data = cdc)
#' MAD(~height | gender, data = cdc)
#' quantile(~height, data = cdc)
#' quantile(~height, data = cdc, probs = 0.6)

iqr <- function(x, ...) {
  if (any(is.na(mosaic::mean(x = x, na.rm = FALSE, ...)))) {
    warning(paste("The data contains missing values\n"))
  }
  output <- mosaic::iqr(x = x, ..., na.rm = TRUE)
  return(output)
}

#' @rdname iqr
IQR <- function(x, ...) {
  if (any(is.na(mosaic::mean(x = x, na.rm = FALSE, ...)))) {
    warning(paste("The data contains missing values\n"))
  }
  output <- mosaic::iqr(x = x, ..., na.rm = TRUE)
  return(output)
}

SAD.simple <- function (x, ...) {
  mean.x <- mosaic::mean(x, ...)
  abs.deviation <- base::abs(x - mean.x)
  sad <- mosaic::sum(abs.deviation, ...)
  return(sad)
}

SAD.formula <- aggregatingFunction1(SAD.simple)

#' @rdname iqr
SAD <- function(x, ...) {
  if (any(is.na(mosaic::mean(x = x, na.rm = FALSE, ...)))) {
    warning(paste("The data contains missing values"))
  }
  output <- SAD.formula(x = x, ..., na.rm = TRUE)
  return(output)
}

#' @rdname iqr
MAD <- function(x, ...) {
  n <- mosaic::favstats(x = x, ...)$n
  output <- SAD(x = x, ...) / n
  return(output)
}

#' @rdname iqr
max <- function(x, ...) {
  if(plyr::is.formula(x)) {
    if (any(is.na(mosaic::mean(x = x, na.rm = FALSE, ...)))) {
      warning(paste("The data contains missing values\n"))
    }
    output <- mosaic::max(x = x, ..., na.rm = TRUE)
  } else {
    output <- base::max(x, ...)
  }
  return(output)
}

#' @rdname iqr
mean <- function(x, ...) {
  if (any(is.na(mosaic::mean(x = x, na.rm = FALSE, ...)))) {
    warning(paste("The data contains missing values\n"))
  }
  output <- mosaic::mean(x = x, na.rm = TRUE, ...)
  return(output)
}

#' @rdname iqr
median <- function(x, ...) {
  if (any(is.na(mosaic::mean(x = x, na.rm = FALSE, ...)))) {
    warning(paste("The data contains missing values\n"))
  }
  output <- mosaic::median(x = x, ..., na.rm = TRUE)
  return(output)
}

#' @rdname iqr
min <- function(x, ...) {
  if(plyr::is.formula(x)) {
    if (any(is.na(mosaic::mean(x = x, na.rm = FALSE, ...)))) {
      warning(paste("The data contains missing values.\n"))
    }
    output <- mosaic::min(x = x, ..., na.rm = TRUE)
  } else {
    output <- base::min(x, ...)
  }
  return(output)
}

#' @rdname iqr
prod <- function(x, ...) {
  if (any(is.na(mosaic::mean(x = x, na.rm = FALSE, ...)))) {
    warning(paste("The data contains missing values\n"))
  }
  output <- mosaic::prod(x = x, ..., na.rm = TRUE)
  return(output)
}

#' @rdname iqr
quantile <- aggregatingFunction1(stats::quantile, output.multiple = TRUE, na.rm = TRUE)

#' @rdname iqr
range <- function(x, ...) {
  if (any(is.na(mosaic::mean(x = x, na.rm = FALSE, ...)))) {
    warning(paste("The data contains missing values\n"))
  }
  output <- mosaic::range(x = x, ..., na.rm = TRUE)
  return(output)
}

#' @rdname iqr
sd <- function(x, ...) {
  if(plyr::is.formula(x)) {
    if (any(is.na(mosaic::mean(x = x, na.rm = FALSE, ...)))) {
      warning(paste("The data contains missing values.\n"))
    }
    output <- mosaic::sd(x = x, ..., na.rm = TRUE)
  } else {
    output <- stats::sd(x, ...)
  }
  return(output)
}

#' @rdname iqr
sum <- function(x, ...) {
  if (any(is.na(mosaic::sum(x = x, ...)))) {
    warning(paste("The data contains missing values\n"))
  }
  output <- mosaic::sum(x = x, ..., na.rm = TRUE)
  return(output)
}

#' @rdname iqr
var <- function(x, ...) {
  if (any(is.na(mosaic::var(x = x, ...)))) {
    warning(paste("The data contains missing values\n"))
  }
  output <- mosaic::var(x = x, ..., na.rm = TRUE)
  return(output)
}

