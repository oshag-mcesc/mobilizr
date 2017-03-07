library(mobilizr)
context("Test plot functions")

# m <- lm(weight ~ height, data = cdc)
# p <- xyplot(weight ~ height, data = cdc) + add_curve(m)

test_that("bargraphs work", {
  expect_true(is.null(bargraph(~age, data = cdc)[[4]]))
  expect_true(is.null(bargraph(~age | gender, data = cdc)[[4]]))
  expect_false(is.null(bargraph(~age, data = cdc, groups = gender)[[4]]))
})

test_that("bwplots work", {
  expect_true(is.null(bwplot(~height, data = cdc)[[4]]))
  expect_equal(length(bwplot(~height | gender, data = cdc)[[35]]), 2)
  expect_match(bwplot(gender~height, data = cdc)[[17]], "gender")
  expect_match(bwplot(height~gender, data = cdc)[[17]], "height")
})

test_that("histograms work", {
  # Fit argument works
  expect_true(is.null(histogram(~height, data = cdc)[[34]]$fit))
  expect_equal(length(histogram(~height | gender, data = cdc)[[35]]), 2)
  expect_match(histogram(~height, data = cdc, fit = "normal")[[34]]$fit, "normal")
})

test_that("xyplots work", {
  # Legend displays appropriately
  expect_true(is.null(xyplot(weight~height, data = cdc)[[4]]))
  expect_false(is.null(xyplot(weight~height, data = cdc, groups = gender)[[4]]
))
  expect_equal(length(xyplot(weight~height | gender, data = cdc)[[35]]), 2)
})

# test_that("add_curve works", {
#   expect_equal(fastdigest(p), "f31fcaec08e316953591cd7f2e38dcf8")
# })

# rm(m)
# rm(p)
