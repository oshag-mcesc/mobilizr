library(mobilizr)
context("poly and kclusters")

# Create models
poly_m <- lm(weight ~ poly(height, 2), data = cdc)

# Test polt
test_that("poly works", {
  expect_equal(unname(coef(poly_m)), c(191.16723, -230.40441, 92.94837), tolerance = 1e5)
})

# Test kclusters
# set.seed(123)
# test_that("kclusters works", {
#
# })

rm(poly_m)

