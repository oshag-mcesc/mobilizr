xsummarise <- function(.data, ...) {
  stopifnot(is.data.frame(.data) || is.list(.data) || is.environment(.data))
  cols <- as.list(substitute(list(...))[-1])
  if (is.null(names(cols))) {
    missing_names <- rep(TRUE, length(cols))
  }
  else {
    missing_names <- names(cols) == ""
  }
  if (any(missing_names)) {
    names <- unname(unlist(lapply(match.call(expand.dots = FALSE)$...,
                                  deparse)))
    names(cols)[missing_names] <- names[missing_names]
  }
  .data <- as.list(.data)
  for (col in names(cols)) {
    .data[[col]] <- eval(cols[[col]], .data, parent.frame())
  }
  quickdf(.data[names(cols)])
}

xsummarize <- function(.data, ...) {
  stopifnot(is.data.frame(.data) || is.list(.data) || is.environment(.data))
  cols <- as.list(substitute(list(...))[-1])
  if (is.null(names(cols))) {
    missing_names <- rep(TRUE, length(cols))
  }
  else {
    missing_names <- names(cols) == ""
  }
  if (any(missing_names)) {
    names <- unname(unlist(lapply(match.call(expand.dots = FALSE)$...,
                                  deparse)))
    names(cols)[missing_names] <- names[missing_names]
  }
  .data <- as.list(.data)
  for (col in names(cols)) {
    .data[[col]] <- eval(cols[[col]], .data, parent.frame())
  }
  quickdf(.data[names(cols)])
}

