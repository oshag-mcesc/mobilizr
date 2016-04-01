#' Reads comma-seperated value data files into R.
#'
#' Reads comma-seperated value data files into R. This function is specially made to work with Mobilize participatory sensing data. After loading the data, certain variable names are cleaned and others are automatically dropped. To read csv data in using the default method, run \code{utils::read.csv()}.
#' @inheritParams utils::read.csv
#' @examples
#' \dontrun{
#' food <- read.csv("Food_Habits_Data.csv")
#' }

read.csv <- function(file, ...) {
  ps_names <- c("user.id", "context.timestamp", "context.location.latitude",
                "context.location.longitude")
  df <- utils::read.csv(file = file, ...)

  if (all(ps_names %in% names(df))) {
    if(length(grep(".key", names(df))) > 0) {
      df <- df %>% select(-ends_with(".key"))
    }
    names(df) <- gsub(names(df), pattern = ".label", replace = "")
    names(df) <- gsub(names(df), pattern = "context.", replace = "")
    names(df) <- gsub(names(df), pattern = "location.", replace = "")
  }
  return(df)
}
