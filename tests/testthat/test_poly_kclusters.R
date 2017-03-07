library(mobilizr)
context("poly and kclusters")

# Create models
poly_m <- lm(weight ~ poly(height, 2), data = cdc)

# Test polt
test_that("poly works", {
  expect_equal(unname(coef(poly_m)), c(191.16723, -230.40441, 92.94837), tolerance = 1e5)
})



# Test kclusters
set.seed(123)
test_that("kclusters works", {
  expect_equal(kclusters(wt_lbs ~ ht_inches, data = futbol, k = 2), c(1, 2, 1, 2, 1, 2, 1, 1, 1, 1, 2, 2, 1, 2, 1, 1, 2, 1, 1, 1, 2, 2, 2, 2, 1, 2, 1, 1, 1, 1, 1, 1, 2, 2, 1, 2, 1, 2, 2, 1, 1, 1, 1, 2, 2))
})

rm(poly_m)

