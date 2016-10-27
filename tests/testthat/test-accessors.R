context("accessors")

test_that("subsetting blob returns blob", {
  x <- as.blob(1:5)
  expect_s3_class(x[1], "blob")
})

test_that("can't insert objects of incorrect type", {
  x <- as.blob(1:5)

  expect_error(x[[1]] <- 1, "must be raw vector")
  expect_error(x[1] <- 1, "must be list of raw vectors")
})
