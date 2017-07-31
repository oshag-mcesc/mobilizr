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
#'
#' @importFrom curl curl
#' @importFrom rstudioapi viewer
#' @importFrom stringr str_extract
#' @export

load_lab <- function(lab) {
  # Create the names of the labs for the menu
  unit_1_titles <- c("Lab 1A", "Lab 1B", "Lab 1C", "Lab 1D", "Lab 1E", "Lab 1F",
                     "Lab 1G", "Lab 1H")
  unit_2_titles <- c("Lab 2A", "Lab 2B", "Lab 2C", "Lab 2D", "Lab 2E", "Lab 2F",
                     "Lab 2G", "Lab 2H", "Lab 2I")
  unit_3_titles <- c("Lab 3A", "Lab 3B", "Lab 3C", "Lab 3D", "Lab 3E", "Lab 3F")
  unit_4_titles <- c("Lab 4A", "Lab 4B", "Lab 4C", "Lab 4D", "Lab 4E", "Lab 4F",
                     "Lab 4G", "Lab 4H")

  # These were added because the labs used during Summer PDs used different
  # campaigns than the actual labs. At some point it'd be nice to remove
  # these labs.
  pd_lab_titles <- c("PD Lab 1D",
                     "PD Lab 1E")

  # Put lab titles together.
  lab_titles <- c(unit_1_titles, unit_2_titles, unit_3_titles, unit_4_titles,
                  pd_lab_titles)

  # If the user specifies a lab file in load_lab(), grab the lab URL.
  if (!missing(lab)) {
    url <- .lab_selector(lab=lab, lab_titles = lab_titles)
  }

  # Otherwise, open a menu for the user to select from and grab the lab URL.
  if (missing(lab)) {
    url <- .lab_selector(lab=NULL, lab_titles = lab_titles)
  }

  # Using the URL for the chosen lab, the following reads in the lab's HTML
  # and displays it in the Viewer pane.

  # Get HTML
  con <- curl::curl(url, "r")
  page <- paste(readLines(con), collapse = '\n')
  close(con)

  # Create a temp HTML file
  tf <- tempfile(fileext = ".html")
  writeLines(page, tf)

  # Display HTML file in the viewer pane.
  rstudioapi::viewer(tf)
}

#' @rdname load_lab
#' @export
load_labs <- function(lab) {
  # Alias to avoid problems with load_lab vs. load_labs in the written
  # curriculum
  load_lab(lab)
}

.format_lab_title <- function (x) {
  # Helper function that formats the lab title, from the menu, to the lab
  # file format for the html.
  x_lower <- tolower(x)
  x_nospace <- gsub(x = x_lower, pattern = ' ', replacement = "")
  clean_title <- gsub(x = x_nospace, pattern = "-", replacement = "")

  unit_num <- str_extract(clean_title, "[1-4]")
  lab_location <- paste0("unit_", unit_num, "/", clean_title, "/", clean_title)
  return(lab_location)
}

# Helper function that displays the actual menu to choose labs from.
.lab_selector <- function (lab, lab_titles) {

  # Since LAUSD will be using the 'legacy' labs for an undiclosed length
  # of time, we'll obtain Lab 1C from a different branch on github.

  # If the version of RStudio is higher than what LAUSD uses, pull labs
  # from the updated branch.
  # If the version of RStudio is the same as what LAUSD uses, pull labs
  # fromt the LAUSD branch
  if (compareVersion(as.character(rstudioapi::getVersion()), "0.99.902") > 0) {
    lab_urls <- paste0("https://raw.githubusercontent.com/mobilizingcs/ids_labs/updated-labs/", .format_lab_title(lab_titles),".html")
  } else {
    lab_urls <- paste0('http://gh.mobilizingcs.org/ids_labs/',
                       .format_lab_title(lab_titles), '.html')
  }

  if (is.null(lab)) {
    # If user doesn't specify a lab to open in load_lab(), prompt them.
    selection <- menu(lab_titles, title = "Enter the number next to the lab you would like to load:")
    .log_loaded_lab(selection)
    url <- lab_urls[selection]
  }

  if (!is.null(lab)) {
    if(!is.numeric(lab) | length(lab) != 1) {
      # If user puts something that's not a number associated with a lab,
      # give the user an error message.
      stop("Input should be either left blank or a single integer.")
    }
    .log_loaded_lab(lab)
    url <- lab_urls[lab]
  }
  return(url)
}

.log_loaded_lab <- function (lab) {
  # logs the load_lab command correctly regardless of how the user selected a lab
  log_info(paste('load_lab(',lab,')', sep = ""))
}
