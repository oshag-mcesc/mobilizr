#' Time Perception Stopwatch
#'
#' A stopwatch to use for the time perception experiment. To use, simply run the
#' function \code{stopwatch()} and then hit enter at the desired time to stop
#' the timer.
#'
#' @examples
#' \dontrun{
#' stopwatch()
#' }
#' @export

stopwatch <- function() {
  .tic()
  cat("The stopwatch has started. \n Press [enter] to stop it.")
  line <- readline()
  .toc()
}

.tic <- function(gcFirst = TRUE, type=c("elapsed", "user.self", "sys.self")) {
  type <- match.arg(type)
  assign(".type", type, envir=baseenv())
  if(gcFirst) gc(FALSE)
  tic <- proc.time()[type]
  assign(".tic", tic, envir=baseenv())
  invisible(tic)
}

.toc <- function() {
  type <- get(".type", envir=baseenv())
  toc <- proc.time()[type]
  tic <- get(".tic", envir=baseenv())
  print(toc - tic)
  invisible(toc)
}
