kclusters_simple <- function(x, k, ...) {
  kmeans(x = x, centers = k, ...)$cluster
}

kclusters <- aggregatingFunction2(tmp)