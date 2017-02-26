library(mobilizr)
context("Test summary functions")

values <- c(1:10, NA)

test_that("iqr function works", {
  expect_equal(iqr(values), 4.5)
  expect_warning(iqr(values), "The data contains missing values")
  expect_equal(iqr(~height, data = cdc), 0.15)
  expect_equal(iqr(~height | gender, data = cdc), c(Female = 0.11, Male = 0.10))
})

test_that("IQR function works", {
  expect_equal(IQR(values), 4.5)
  expect_warning(IQR(values), "The data contains missing values")
  expect_equal(IQR(~height, data = cdc), 0.15)
  expect_equal(IQR(~height | gender, data = cdc), c(Female = 0.11, Male = 0.10))
})

test_that("SAD function works", {
  expect_equal(SAD(values), 25)
  expect_warning(SAD(values), "The data contains missing values")
  expect_equal(round(SAD(~height, data = cdc), digits = 3), 1072.637)
  expect_equal(round(SAD(~height | gender, data = cdc), digits = 4), c(Female = 373.5463, Male = 436.0658))
})

test_that("MAD function works", {
  expect_equal(MAD(values), 2.5)
  expect_warning(MAD(values), "The data contains missing values")
  expect_equal(round(MAD(~height, data = cdc), digits = 8), 0.08211886)
  expect_equal(round(MAD(~height | gender, data = cdc), digits = 8), c(Female = 0.05755722, Male = 0.06635207))
})

test_that("max function works", {
  expect_true(is.na(max(values)))
  expect_warning(max(~height, data = cdc), "The data contains missing values")
  expect_equal(max(~height, data = cdc), 2.11)
  expect_equal(max(~height | gender, data = cdc), c(Female = 1.98, Male = 2.11))
})

test_that("mean function works", {
  expect_equal(mean(values), 5.5)
  expect_warning(mean(values), "The data contains missing values")
  expect_equal(round(mean(~height, data = cdc), digits = 6), 1.694038)
  expect_equal(round(mean(~height | gender, data = cdc), digits = 6), c(Female = 1.629911, Male = 1.757365))
})

test_that("median function works", {
  expect_equal(median(values), 5.5)
  expect_warning(median(values), "The data contains missing values")
  expect_equal(median(~height, data = cdc), 1.68)
  expect_equal(median(~height | gender, data = cdc), c(Female = 1.63, Male = 1.75))
})

test_that("min function works", {
  expect_true(is.na(min(values)))
  expect_warning(min(~height, data = cdc), "The data contains missing values")
  expect_equal(min(~height, data = cdc), 1.27)
  expect_equal(min(~height | gender, data = cdc), c(Female = 1.27, Male = 1.35))
})

test_that("prod function works", {
  expect_equal(prod(values), 3628800)
  expect_warning(prod(values), "The data contains missing values")
  expect_equal(round(prod(~height, data = head(cdc)), digits = 5), 24.20122)
  expect_equal(round(prod(~height | gender, data = head(cdc)), digits = 6), c(Female = 4.519368, Male = 5.355000))
})

test_that("quantile function works", {
  expect_equal(quantile(values), c("0%" = 1, "25%" = 3.25, "50%" = 5.5, "75%" = 7.75, "100%" = 10))
  expect_warning(quantile(quantile(~height, data = cdc)), "The data contains missing values")
  expect_equal(quantile(~height, data = cdc), c("0%" = 1.27, "25%" = 1.63, "50%" = 1.68, "75%" = 1.78, "100%" = 2.11))
  expect_equal(unname(quantile(~height | gender, data = cdc)), c(1.27, 1.57, 1.63, 1.68, 1.98, 1.35, 1.7, 1.75, 1.8, 2.11))
})

rm(values)
