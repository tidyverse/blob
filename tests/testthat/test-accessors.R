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

test_that("can insert raw or NULL", {
  x <- as.blob(1:4)

  x[[1]] <- as.raw(0)
  x[2] <- list(as.raw(0))
  x[[3]] <- NULL
  x[4] <- list(NULL)

  expect_equal(x, blob(as.raw(0), as.raw(0), NULL, NULL))
})
