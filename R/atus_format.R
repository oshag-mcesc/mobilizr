#' Cleans and formats data from the Time Use campaign.
#'
#' Cleans and formats data from the Time Use campaign. Each observation will be
#' the average time spent participating in various activities over the data
#' collection period for each user.
#' @param data Data frame. The unaltered Time Use campaign data that is
#'   downloaded, uploaded and loaded from
#'   \href{https://lausd.mobilizingcs.org/navbar/web}{the Mobilize Web Front
#'   End}.
#' @return The average time spent participating in various activities for each
#'   participant.
#' @section How it works: The code cleans and aggregates the data in a 3-step
#'   process. \enumerate{ \item The first step is to do some preliminary
#'   cleaning of the data. This includes a step to turn "NOT_DISPLAYED" values
#'   into 0's. This is done because when a user does not select a category to
#'   note the amount of time they've participated, it's assumed
#'   that the reason is because they've  participated in the activity for 0
#'   minutes. \item The next step is to sum the amount of time spent doing the
#'   various activities for each day. This then represents the total amount of
#'   time spent performing the various activities over the course of each day.
#'   \item Finally, the third step is to take the summed times for each day from
#'   step 2. and average them over the total number of days they
#'   participated in the campaign.}
#' @examples
#' \dontrun{
#' atus_raw <- read.csv("My class time use data.csv")
#' atus_data <- atus_format(atus_raw)
#' }

atus_format <- function(data) {
  time_use_vars <- c("chores", "day","friends", "grooming",
                     "homework", "meals", "online", "read",
                     "school", "sleep", "sports", "television",
                     "travel", "videogames", "work",
                     "context.location.latitude",
                     "context.location.longitude")
  clean_data <- sapply(data, function(x) gsub(x, pattern="NOT_DISPLAYED",
                                              replacement=0)) %>%
    as.data.frame(., stringsAsFactors=FALSE)
  clean_data[time_use_vars] <- sapply(clean_data[time_use_vars], as.numeric)

  sum_atus <- clean_data %>%
    dplyr::group_by(user.id, day) %>%
    dplyr::summarise(chores = sum(chores),
              friends = sum(friends),
              grooming = sum(grooming),
              homework = sum(homework),
              meals = sum(meals),
              online = sum(online),
              read = sum(read),
              school = sum(school),
              sleep = sum(sleep),
              sports = sum(sports),
              television = sum(television),
              travel = sum(travel),
              videogames = sum(videogames),
              work = sum(work))

  mean_atus <- sum_atus %>%
    dplyr::group_by(user.id) %>%
    dplyr::summarise(chores = mean(chores),
              friends = mean(friends),
              grooming = mean(grooming),
              homework = mean(homework),
              meals = mean(meals),
              online = mean(online),
              read = mean(read),
              school = mean(school),
              sleep = mean(sleep),
              sports = mean(sports),
              television = mean(television),
              travel = mean(travel),
              videogames = mean(videogames),
              work = mean(work))
  return(mean_atus)
}
