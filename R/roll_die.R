roll_die <- function(die, times = 1) {
  if (!die %in% c("A", "B")) {
    stop("Please set the die argument to be either 'A' or 'B'")
  }
  if (die == "A") {
    rolls <- sample(1:6, size = times, replace = TRUE)
  }
  if (die == "B") {
    s_unfair <- 0.22
    s_fair <- (1 - s_unfair)/5
    probs <- rep(s_fair, 6)
    probs[3] <- s_unfair
    rolls <- sample(1:6, size = times, prob = probs, replace = TRUE)
  }
  cat("Your roll(s):\n")
  rolls
}
#
# # These should work
# roll_die("A", times = 15)
# a <- roll_die("A", times = 15)
# a
# roll_die("B", times = 15)
# b <- roll_die("B", times = 15)
# b
#
# # These should not.
# roll_die("C", times = 15)
# roll_die(1, times = 15)
#
# # These are what the outcomes look like for 100 rolls
# library(ggplot2)
# library(reshape2)
# n <- 100
# df <- data.frame(roll = 1:n, die_A = roll_die("A", times = n), die_B = roll_die("B", times = n))
# df_m <- melt(df, id.vars = "roll", measure.vars = c("die_A", "die_B"),
#              variable.name = "die", value.name = "outcome")
# ggplot(df_m, aes(x = outcome)) + geom_bar(color = "white", binwidth = 1) + facet_wrap( ~ die)
#
# # These are what the outcomes look like for 500 rolls
# n <- 500
# df <- data.frame(roll = 1:n, die_A = roll_die("A", times = n), die_B = roll_die("B", times = n))
# df_m <- melt(df, id.vars = "roll", measure.vars = c("die_A", "die_B"),
#              variable.name = "die", value.name = "outcome")
# ggplot(df_m, aes(x = outcome)) + geom_bar(color = "white", binwidth = 1) + facet_wrap( ~ die)
#
# # These are what the outcomes look like for 500 rolls
# n <- 5000
# df <- data.frame(roll = 1:n, die_A = roll_die("A", times = n), die_B = roll_die("B", times = n))
# df_m <- melt(df, id.vars = "roll", measure.vars = c("die_A", "die_B"),
#              variable.name = "die", value.name = "outcome")
# ggplot(df_m, aes(x = outcome)) + geom_bar(color = "white", binwidth = 1) + facet_wrap( ~ die)
#
# mosaic::tally(roll_die("B", times = 1000))
