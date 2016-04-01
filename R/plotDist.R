plotDist <- function(dist, ..., kind = c("density", "cdf", "qq", "histogram"), xlab = "", ylab = "", breaks = NULL, type, resolution = 5000) {
  mosaic::plotDist(dist = dist, params = list(...), kind = kind, xlab = xlab, ylab = ylab, breaks = breaks, type = type, resolution = 5000)
}
