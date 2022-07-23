source("solutions.R")

test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("power works", {
  expect_equal(2 ** 3, 8)
})

test_that("simulated function" ,{
  expect_equal(length(test(10)), 10)
})