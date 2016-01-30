rflip <- function(n = 1, prob = 0.5, quiet = FALSE, verbose = !quiet) {
  if (n > 500) {
    stop("Number of flips should be less than or equal to 500")
  } else {
    mosaic::rflip(n = n , prob = prob, quiet = quiet, verbose = verbose)
  }
}
