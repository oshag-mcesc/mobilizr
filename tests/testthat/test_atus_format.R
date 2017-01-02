library(mobilizr)
context("Check atus_format")

timeuse <- read.csv("data/timeuse_sample.csv")
timeuse_formatted <- atus_format(timeuse)

test_that("atus_format works", {
  expect_equal(dim(timeuse_formatted), c(34, 15))
  expect_equal(round(mean(timeuse_formatted$school)), 429)
})

rm(timeuse)
rm(timeuse_formatted)
