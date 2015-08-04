quantile <- function (x, ..., data, groups = NULL, ..fun.. = stats::quantile,
                      na.rm = getOption("na.rm", FALSE))
{
  orig.call <- match.call()
  fun.call <- orig.call
  fun.call[[1]] <- substitute(..fun..)
  fun.call[[2]] <- substitute(x)
  missingData <- FALSE
  if (missing(data)) {
    missingData <- TRUE
    data = parent.frame()
    result <- tryCatch(eval(fun.call, envir = parent.frame()),
                       error = function(e) {
                         e
                       }, warning = function(w) {
                         w
                       })
    if (!inherits(result, "warning") && !inherits(result,
                                                  "error")) {
      return(result)
    }
  }
  maggregate.call <- orig.call
  x_name <- substitute(x)
  if (!mosaic::.is.formula(x)) {
    if (!missingData) {
      fun.call[["data"]] <- NULL
    }
    if (input.multiple) {
      result <- tryCatch(eval(fun.call, envir = data, enclos = parent.frame()),
                         error = function(e) {
                           e
                         }, warning = function(w) {
                           w
                         })
      if (!inherits(result, "warning") && !inherits(result,
                                                    "error")) {
        return(result)
      }
    }
    x <- eval(substitute(mosaic_formula_q(.x, groups = quote(groups)),
                         list(.x = substitute(x), .g = substitute(groups))))
    if ("groups" %in% names(maggregate.call))
      maggregate.call[["groups"]] <- NULL
  }
  maggregate.call[[1]] <- quote(maggregate)
  maggregate.call$formula <- x
  maggregate.call$data <- data
  maggregate.call$x <- NULL
  maggregate.call$FUN <- substitute(..fun..)
  maggregate.call$.multiple <- output.multiple
  maggregate.call$na.rm <- substitute(na.rm)
  return(eval(maggregate.call, envir = envir))
}
