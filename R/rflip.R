#' Coin flip.
#'
#' Flip a coin 500 times or fewer.
#'
#' @param n Integer. The number of times to flip the coin.
#' @param prob Number between 0 and 1. The probability of getting a "head".
#'   Default value is 0.5.
#' @param quiet Logical. Should a message be printed with the output? Default is
#'   \code{FALSE}, meaning a message will be printed.
#' @param verbose Logical. The opposite of quiet from above. Should a message be
#'   printed? Default value is \code{TRUE}. Note, either quiet or verbose can be
#'   specified, but not both.
#'
#' @examples
#' # Basic usage. Note the printed output.
#' rflip()
#'
#' # The printed output can be turned off using either method:
#' rflip(quiet = TRUE)
#' rflip(verbose = FALSE)
#'
#' # Flip an unfair coin many times
#' flips <- rflip(100, prob = 0.35)
#' flips
#'
#' # The actual output is embedded as an attribute
#' attr(flips, "sequence")
#'
#' # Create a bargraph of the output
#' flips_output <- attr(flips, "sequence")
#' bargraph(~flips_output)
#'
#' @importFrom mosaic rflip
#' @export

rflip <- function(n = 1, prob = 0.5, quiet = FALSE, verbose = !quiet) {

  # Prevent students from flipping more than 500 coins to avoid them hogging computational resources
  if (n > 500) {
    stop("Number of flips should be less than or equal to 500")
  } else {

    # Flip the coins
    rflip(n = n , prob = prob, quiet = quiet, verbose = verbose)
  }
}
