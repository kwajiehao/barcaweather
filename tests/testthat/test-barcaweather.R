context("test-barcaweather.R")

test_that("invalid inputs", {
  expect_equal(barcaweather(-1), 'invalid value for day entered')
})

test_that("invalid inputs part 2", {
  expect_equal(barcaweather('abc'), 'invalid value for day entered')
})

test_that("checking output of function", {
  expect_equal(is.double(barcaweather(1)), TRUE)
})
