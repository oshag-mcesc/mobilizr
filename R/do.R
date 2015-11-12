#' A wrapper for the mosaic package's \code{do} function.
#'
#' Number of iterations is capped at 500 to prevent individual users from
#' hogging server computation time. Additional details about the \code{do}
#' function can be found in the \code{\link[mosaic]{do}} package documentation
#' @inheritParams mosaic::do
#' @return A data frame of the values for the repeated function.
#' @section Note: Find more examples, help and details at the help page for
#'   \code{\link[mosaic]{do}} in the \code{mosaic} package.
#' @examples
#' do(10) * sample(1:10, size=2)
#'

do <- function(N) {
  if (N > 500) stop("Number of iterations must not exceed 500. Choose a smaller number of iterations and try again.")
  df <- mosaic::do(N, mode = 'data.frame')
  if (length(names(df) == 1)) names(df) <- "result"
  return(df)
}

