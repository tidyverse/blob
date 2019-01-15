context("accessors")

test_that("subsetting blob returns blob", {
  x <- as.blob(1:5)
  expect_s3_class(x[1], "blob")
})

test_that("can't insert objects of incorrect type", {
  x <- as.blob(1:5)

  expect_error(x[[1]] <- 1, "RHS must be raw vector or NULL", fixed = TRUE)
  expect_error(x[1] <- 1, "Can't cast <double> to <blob>", fixed = TRUE)
})

test_that("can insert raw or NULL", {
  x <- as.blob(1:4)

  x[[1]] <- as.raw(0)
  x[2] <- list(as.raw(0))
  x[[3]] <- NULL
  x[4] <- list(NULL)

  expect_equal(x, blob(as.raw(0), as.raw(0), NULL, NULL))
})

test_that("can combine", {
  expect_identical(
    c(blob(raw(4), raw(5)), blob(raw(7))),
    blob(raw(4), raw(5), raw(7))
  )
  expect_identical(
    # Doesn't work with c()
    vec_c(list(raw(4), raw(5)), blob(raw(7))),
    blob(raw(4), raw(5), raw(7))
  )
  expect_identical(
    vec_c(list(raw(7)), blob(raw(4), raw(5)), list(raw(7))),
    blob(raw(7), raw(4), raw(5), raw(7))
  )
  expect_identical(
    vec_c(NA, blob()),
    blob(NULL)
  )
  expect_identical(
    c(blob(), NA),
    blob(NULL)
  )
  expect_error(
    c(blob(raw(4), raw(5)), raw(7))
  )
  expect_error(
    c(blob(raw(4), raw(5)), 7)
  )
})
