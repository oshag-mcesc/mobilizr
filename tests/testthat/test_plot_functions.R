library(mobilizr)
context("Test plot functions")

test_that("histograms work", {
  # Fit argument works
  expect_true(is.null(histogram(~height, data = cdc)[[34]]$fit))
  expect_match(histogram(~height, data = cdc, fit = "normal")[[34]]$fit, "normal")
})

test_that("bargraphs work", {
  # Legend displays appropriately
  expect_true(is.null(bargraph(~age, data = cdc)[[4]]))
  expect_true(is.null(bargraph(~age | gender, data = cdc)[[4]]))
  expect_false(is.null(bargraph(~age, data = cdc, groups = gender)[[4]]))
})

test_that("xyplots work", {
  # Legend displays appropriately
  expect_true(is.null(xyplot(weight~height, data = cdc)[[4]]))
  expect_false(is.null(xyplot(weight~height, data = cdc, groups = gender)[[4]]
))
})
