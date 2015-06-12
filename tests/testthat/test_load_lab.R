library(mobilizr)
context("Load labs")

test_that("Load lab breaks", {
  expect_error(load_lab(0))
  expect_error(load_lab("1A"))
})
