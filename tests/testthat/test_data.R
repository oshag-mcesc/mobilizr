library(mobilizr)
context("Test data files")

test_that("Preloaded data loads", {
  expect_equal(dim(atu_clean), c(12443, 8))
  expect_equal(dim(atu_dirty), c(12443, 8))
  expect_equal(dim(atus), c(12443, 43))
  expect_equal(dim(cdc), c(14041, 26))
  expect_equal(dim(slasher), c(485, 2))
  expect_equal(dim(titanic), c(1000, 7))
  expect_equal(dim(titanic_test), c(308, 7))
})
