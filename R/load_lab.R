#' Load lab slides into RStudio's Viewer Pane
#'
#' Load lab slides into RStudio's Viewer Pane. The function can either be called
#' without an argument \code{load_lab()}, in which case a menu will appear in
#' the console for the user to make their selection, or with a number indicating
#' the desired lab as an argument.
#'
#' @param lab Integer (optional). Including an integer will load the desired lab
#'   automatically. Leaving the argument blank will load a menu for users to
#'   make a selection from.
#' @examples
#' load_lab() # Loads a menu to choose from
#' load_lab(1) # Automatically loads the 1st lab from the menu.
#' load_labs() # Similar to load_lab()
#' load_labs(1) # Similar to load_lab(1)

load_lab <- function(lab) {
  unit_1_titles <- c("Lab 1A",
                     "Lab 1B",
                     "Lab 1C",
                     "Lab 1D",
                     "Lab 1E",
                     "Lab 1F",
                     "Lab 1G",
                     "Lab 1H")
  unit_2_titles <- c("Lab 2A",
                     "Lab 2B",
                     "Lab 2C",
                     "Lab 2D",
                     "Lab 2E",
                     "Lab 2F",
                     "Lab 2G",
                     "Lab 2H",
                     "Lab 2I",
                     "Lab 2J")
  unit_3_titles <- c("Lab 3A",
                     "Lab 3B",
                     "Lab 3C",
                     "Lab 3D",
                     "Lab 3E",
                     "Lab 3F",
                     "Lab 3G")
  unit_4_titles <- c("Lab 4A",
                     "Lab 4B",
                     "Lab 4C",
                     "Lab 4D",
                     "Lab 4E",
                     "Lab 4F",
                     "Lab 4G",
                     "Lab 4H")

  lab_titles <- c(unit_1_titles,
                  unit_2_titles,
                   unit_3_titles) #,
                  # unit_4_titles)

  if (!missing(lab)) {
    url <- .lab_selector(lab=lab, lab_titles=lab_titles)
  }
  if (missing(lab)) {
    url <- .lab_selector(lab=NULL, lab_titles=lab_titles)
  }

  con <- curl::curl(url, "r")
  page <- paste(readLines(con),
                collapse = '\n')
  close(con)

  tf <- tempfile(fileext = ".html")
  writeLines(page, tf)
  rstudioapi::viewer(tf)
}

#' @rdname load_lab
load_labs <- function(lab) {
  load_lab(lab)
}

.format_lab_title <- function (x) {
  x_lower <- tolower(x)
  x_nospace <- gsub(x = x_lower, pattern = ' ', replacement = "")
  clean_title <- gsub(x = x_nospace, pattern = "-", replacement = "")
  clean_title
}

.lab_selector <- function (lab, lab_titles) {
  lab_urls <- paste0('https://web.ohmage.org/mobilize/resources/ids/labs/',
                     .format_lab_title(lab_titles), '.html')
  if (is.null(lab)) {
    selection <- menu(lab_titles, title = "Enter the number next to the lab you would like to load:")
    url <- lab_urls[selection]
  }
  if (!is.null(lab)) {
    url <- lab_urls[lab]
  }
  return(url)
}
