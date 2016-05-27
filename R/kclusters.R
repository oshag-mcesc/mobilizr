kclusters_simple <- function(x, k, ...) {
  kmeans(x = x, centers = k, ...)$cluster
}

kclusters <- mosaic::aggregatingFunction2(kclusters_simple)