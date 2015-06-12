library(mobilizr)
context("Data loads")

test_that("Preloaded data loads", {
  expect_equal(dim(cdc), c(14041, 26))
  expect_equal(dim(atus), c(12443, 43))
})
