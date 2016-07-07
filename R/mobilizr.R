#' mobilizr: Functions for the Mobilize Intro to Data Science course.
#'
#' mobilizr provides wrappers and other functions to help students focus on the
#' essentials of learning to code and conduct data science.
#'
#' To learn more about Mobilize and the Introduction to Data Science course see
#' \href{http://www.mobilizingcs.org}{the Mobilize homepage}.
#'
#' @docType package
#' @name mobilizr
NULL


#' Arm Span and Height Data
#'
#' A dataset containing the arm spans, heights and additional information from a
#' group of Los Angeles high school students.
#'
#' \itemize{ \item age. The age of the student. \item gender_label. The gender
#' of the student. \item armspan. The self-reported length of the student's arm
#' span, in inches. \item height. The self-reported height of the student, in
#' inches. }
#'
#' @docType data
#' @keywords dataset
#' @name arm_span
#' @usage data(arm_span)
#' @format A data frame with 90 observations of 4 variables.
NULL


#' American Time Use Survey Sample - Clean
#'
#' A dataset containing a subset of variables from the American Time Use Survey.
#' This dataset is a cleaned version of \code{atu_dirty}.
#'
#' \itemize{ \item caseid. unique identifier of individual survey participant
#' \item age. the age of the respondent \item gender. the gender of the
#' respondent  \item fulltime_emp. the employment status of the respondent \item
#' phys_challenge. does the respondent have a physical difficulty  \item sleep.
#' the length of time the person sleeps, in minutes \item homework. How long the
#' respondent spent on homework assignments, in minutes \item socializing. the
#' number of minutes the respondent spent socializing }
#'
#' @docType data
#' @keywords dataset
#' @name atu_clean
#' @usage data(atu_clean)
#' @seealso \link{atu_dirty}
#' @format A data frame with 12,443 observations of 8 variables
#' @source \url{http://www.bls.gov/tus/}
NULL

#' American Time Use Survey Sample - Dirty
#'
#' A dataset containing a subset of variables from the American Time Use Survey.
#' This dataset is "dirty", meaning it has elements which require formatting
#' before use.
#'
#' \itemize{ \item caseid. unique identifier of individual survey participant
#' \item V1. the age of the respondent \item V2. the gender of the respondent
#' (1: Male, 2: Female) \item V3. the employment status of the respondent \item
#' V4. does the respondent have a physical difficulty (1: Person did not report
#' having a physical difficulty, 2: Person surveyed reported the have a physical
#' difficulty) \item V5. the length of time the person sleeps, in minutes \item
#' V6. How long the respondent spent on homework assignments, in minutes \item
#' V7. the number of minutes the respondent spent socializing }
#'
#' @docType data
#' @keywords dataset
#' @name atu_dirty
#' @usage data(atu_dirty)
#' @seealso \link{atu_clean}
#' @format A data frame with 12,443 observations of 8 variables
#' @source \url{http://www.bls.gov/tus/}
NULL

#' American Time Use Survey
#'
#' A dataset containing responses from the American Time Use Survey. Each
#' participant is asked to document the amount of time spent participating in
#' various activities for a single 24 hour period. Variables provided are a
#' subset of the entire survey.
#'
#' \itemize{ \item caseid. unique identifier of individual survey participant
#' \item state. state of residence \item age. age of respondent \item gender.
#' gender of respondent \item citizen. citizenship status of the respondent
#' \item marital_stat. marital status of the respondent \item veteran. veteran
#' status of the respondent \item active_armedforces. is the respondent an
#' active service member of the U.S. armed forces? \item emp_status. status of
#' employment \item multi_jobs. is the respondent working multiple jobs \item
#' work_class. the type of work done by the respondent for employment \item
#' retired. is the respondent retired \item fulltime_emp. the fulltime
#' employment status of the respondent \item hours_worked. hours worked by
#' respondent \item fam_income. income range of respondent's household \item
#' household_size. number of people living within the respondent's household
#' \item household_kids. number of children, under the age of 18, living in the
#' respondent's household \item household_child. is there a child, under the age
#' of 18, living in the household \item phys_challenge. does the respondent have
#' a physical difficulty \item travel. time spent traveling, in minutes \item
#' phone. time spent talking on a phone, in minutes \item volunteer. time spent
#' volunteering, in minutes \item religion. time spend participating in
#' religious activities, in minutes \item sports. time spent playing sports, in
#' minutes \item social. time spent socializing, in minutes \item food. time
#' spent eating or preparing food, in minutes \item gov_civic. time spent
#' participating in civic engagement activities, in minutes \item household.
#' time spent performing household duties, in minutes \item pro_services. time
#' spent engaged in professional services, in minutes \item purchasing. time
#' spent shopping, in minutes \item education. time spent in educational
#' activities, in minutes \item work. time spent in work related activites, in
#' minutes \item care_nonhousehold. time spent engaged in non-household related
#' duties, in minutes \item care_household. time spend providing care within
#' respondent's household, in minutes \item household_chores. time spent
#' participating in household chores, in minutes \item personal_care. time spent
#' on personal care, in minutes \item sleep. time spent sleeping, in minutes
#' \item groom. time spent grooming, in minutes \item health_related. time spent
#' in health related actvities, in minutes \item eating. time spent eating, in
#' minutes \item class. time spent within a classroom, in minutes \item
#' homework. time spent on homework, in minutes \item socializing. time spent
#' socializing, in minutes}
#'
#' @docType data
#' @keywords dataset
#' @name atus
#' @usage data(atus)
#' @format A data frame with 12,443 observations of 43 variables
#' @source \url{http://www.bls.gov/tus/}
NULL


#' CDC Youth Risk Behaviour survey
#'
#' A dataset containing responses from the CDC Youth Risk Behavior Survey.
#'
#' \itemize{ \item age. age in years \item grade. grade in school \item gender.
#' sex assigned at birth \item hisp_latino. whether or not student identifies as
#' Hispanic or Latino \item race. race the student identifies with (A: American
#' Indian or Alaska Native, B: Asian, C: Black or African American, D: Native
#' Hawaiian or Other Pacific Islander, E: White, F: Hispanic or Latino, G:
#' Multiple - Hispanic or Latino, H: Multiple - Non-Hispanic/Latino) \item
#' height. height of student in meters \item weight. weight of student in
#' kilograms \item general_health. student perception of their health \item
#' hours_sleep. reported hours of sleep on school nights \item asthma. student
#' diagnosed as having asthma \item depressed. student reported feeling
#' depressed for 2 weeks in a row, or more, during the past 12 months \item
#' helmet. how often student wore a helmet while bicycling during the past 12
#' months \item seat_belt. how often student wore a seatbelt in motor vehicle
#' driven by someone else \item sunscreen. how often student reported wearing
#' sunscreen on sunny days \item describe_weight. student perception of their
#' weight relative to what they believe it should be \item eat_fruit. how often
#' student ate fruit over the previous 7 days \item eat_salad. how often student
#' ate salad over the previous 7 days \item drink_soda. how often student
#' consumed soda over the previous 7 days \item drink_milk. how often student
#' drank milk over the previous 7 days \item days_exercise_20. how often student
#' was active for at least 20 mins over the previous 7 days. \item
#' days_exercise_60. how often student was active for at least 60 mins over the
#' previous 7 days. \item number_teams. number of sports teams played on during
#' previous 12 months \item hours_tv. average number of hours spent watching tv
#' on a school day \item hours_videogame. average number of hours spent playing
#' videogames on a school day \item days_smoking. number of days student
#' reported smoking cigarettes during past 30 days \item fights. number of
#' fights student has been during the past 12 months }
#'
#' @docType data
#' @keywords dataset
#' @name cdc
#' @usage data(cdc)
#' @format A data frame with 14,041 observations of 26 variables
#' @source \url{http://www.cdc.gov/HealthyYouth/yrbs/index.htm}
NULL


#' LA Department of Water and Power (2010)
#'
#' Water usage from the Los Angeles Department of Water and Power, by census
#' block, for the year 2010. Some blocks are dropped due to identifiability
#' concerns.
#'
#' \itemize{ \item census. The census block. \item sector_type. Indicates the
#' type of customers using water. \item longitude. The longitudinal centroid of
#' the census block. \item latitude. The latitudinal centroid of the census
#' block. \item census_pop. The number of people residing within the census
#' block. \item total. The total amount of water used in the year in hundreds of
#' cubic feet for each census block. \item july - june. The amount of water used
#' per month in hundreds of cubic feet for each census block. \item count. The
#' number of users measured per census block by sector type.}
#'
#' @docType data
#' @keywords dataset
#' @name dwp_2010
#' @usage data(dwp_2010)
#' @format A data frame with 1,705 observations of 19 variables
#' @seealso \link{dwp_student}, \link{dwp_teacher}
#' @source \url{https://www.ladwp.com}
NULL


#' LA Department of Water and Power (2010) - Student
#'
#' Water usage from the Los Angeles Department of Water and Power, by census
#' block, for the year 2010. Some blocks are dropped due to identifiability
#' concerns. This data set is used for a student practicum and contains 1,193 randomly selected observations. The remaining 512 observations can be found in the \code{\link{dwp_teacher}} data.
#'
#' \itemize{ \item census. The census block. \item sector_type. Indicates the
#' type of customers using water. \item longitude. The longitudinal centroid of
#' the census block. \item latitude. The latitudinal centroid of the census
#' block. \item census_pop. The number of people residing within the census
#' block. \item total. The total amount of water used in the year in hundreds of
#' cubic feet for each census block. \item july - june. The amount of water used
#' per month in hundreds of cubic feet for each census block. \item count. The
#' number of users measured per census block by sector type.}
#'
#' @docType data
#' @keywords dataset
#' @name dwp_student
#' @usage data(dwp_student)
#' @format A data frame with 1,193 observations of 19 variables
#' @seealso \link{dwp_2010}, \link{dwp_teacher}
#' @source \url{https://www.ladwp.com}
NULL


#' LA Department of Water and Power (2010) - Teacher
#'
#' Water usage from the Los Angeles Department of Water and Power, by census
#' block, for the year 2010. Some blocks are dropped due to identifiability
#' concerns. This data set is used for a student practicum and contains 512 observations can be used by teachers to validate the student models.
#'
#' \itemize{ \item census. The census block. \item sector_type. Indicates the
#' type of customers using water. \item longitude. The longitudinal centroid of
#' the census block. \item latitude. The latitudinal centroid of the census
#' block. \item census_pop. The number of people residing within the census
#' block. \item total. The total amount of water used in the year in hundreds of
#' cubic feet for each census block. \item july - june. The amount of water used
#' per month in hundreds of cubic feet for each census block. \item count. The
#' number of users measured per census block by sector type.}
#'
#' @docType data
#' @keywords dataset
#' @name dwp_teacher
#' @usage data(dwp_teacher)
#' @format A data frame with 512 observations of 19 variables
#' @seealso \link{dwp_2010}, \link{dwp_student}
#' @source \url{https://www.ladwp.com}
NULL


#' Futbol Data Set
#'
#' Futbol
#'
#' \itemize{
#'  \item
#' }
#'
#' @docType data
#' @keywords dataset
#' @name futbol
#' @usage data(futbol)
#' @format A data frame with _ observations of _ variables
#' @source \url{}
NULL


#' Movie Data Set
#'
#' Movie
#'
#' \itemize{
#'  \item
#' }
#'
#' @docType data
#' @keywords dataset
#' @name movie
#' @usage data(movie)
#' @format A data frame with _ observations of _ variables
#' @source \url{http://www.rottentomatos.com}
NULL


#' Survival status of actors and actresses in "Slasher" films
#'
#' A dataset containing survival statuses of actors and actresses in 50 randomly sampled "Slasher" films.
#'
#' \itemize{ \item gender. the gender of actor/actress \item survival. the survival status of the actor/actress }
#'
#' @docType data
#' @keywords dataset
#' @name slasher
#' @usage data(slasher)
#' @format A data frame with 485 observations of 2 variables
NULL

#' Titanic passenger data
#'
#' A dataset Containing Information on 1,000 Randomly Sampled Passengers of the
#' Titanic.
#'
#' \itemize{ \item name. name of passenger \item age. age of passenger \item
#' gender. gender of passenger \item fare. amount paid for ticket to sail on the
#' Titanic \item class. the class hospitality/room aboard the Titanic \item
#' embarked. location passenger first stepped on board the Titanic \item
#' survived. the survival status of the passenger }
#'
#' @docType data
#' @keywords dataset
#' @name titanic
#' @usage data(titanic)
#' @seealso \link{titanic_test}
#' @format A data frame with 1,000 observations of 7 variables
#' @source \url{http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/titanic.html}
NULL

#' Titanic Passenger Survivial Test Data
#'
#' A dataset containing information on 308 passengers of the Titanic that are
#' not included in the \code{titanic} data set.
#'
#' \itemize{ \item name. name of passenger \item age. age of passenger \item
#' gender. gender of passenger \item fare. amount paid for ticket to sail on the
#' Titanic \item class. the class hospitality/room aboard the Titanic \item
#' embarked. location passenger first stepped on board the Titanic \item
#' survived. the survival status of the passenger }
#'
#' @docType data
#' @keywords dataset
#' @name titanic_test
#' @usage data(titanic_test)
#' @seealso \link{titanic}
#' @format A data frame with 308 observations of 7 variables
#' @source \link{http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/titanic.html}
NULL
