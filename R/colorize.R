colorize <- function(x) {
  if(!is.factor(x)) {
    x <- as.factor(x)
  }
  lvls <- levels(x)
  if(length(lvls) > 12) {
    stop("Variable must have 12 or fewer categories")
  }
  cols <- brewer.pal(n = length(lvls), name = "Paired")
  c_mat <- outer(x, lvls, "==")
  cols[apply(c_mat, 1, which)]
}
