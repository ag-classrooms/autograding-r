source("solutions.R")

test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("power works", {
  expect_equal(2 ** 3, 8)
})

test_that("simulated function" ,{
  expect_equal(length(test(10)), 5)
})

test_that("simulated max" ,{
  expect_lte(max(test(10)), 1)
})

test_that("simulated min" ,{
  expect_gte(min(test(10)), 0)
})
