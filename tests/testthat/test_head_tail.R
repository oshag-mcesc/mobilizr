library(mobilizr)
context("Test head/tail functions")

test_that("head works", {
  expect_identical(head(1:10), 1:6)
  expect_identical(head(~height, data = cdc), c(1.7, 1.75, 1.8, 1.47, 1.83, 1.68))
})

test_that("tail works", {
  expect_identical(tail(1:10), 5:10)
  expect_identical(tail(~height, data = cdc), c(1.75, 1.65, 1.57, 1.78, 1.73, 1.57))
})
