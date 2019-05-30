context("accessors")

test_that("subsetting blob returns blob", {
  x <- blob(!!!as.raw(1:5))
  expect_s3_class(x[1], "blob")
})

test_that("subsetting can return NA", {
  x <- blob(!!!as.raw(1:5))
  expect_identical(x[NA_integer_], blob(NULL))
  expect_identical(x[c(5, NA)], blob(as.raw(5L), NULL))
})

test_that("subset assignment works", {
  x <- blob(!!!as.raw(1:5))
  x[3] <- blob(raw(1))
  expect_identical(x, blob(!!!as.raw(c(1:2, 0L, 4:5))))
  x[[4]] <- raw(1)
  expect_identical(x, blob(!!!as.raw(c(1:2, 0L, 0L, 5L))))
  x[7] <- blob(raw(1))
  expect_identical(x, blob(!!!as.raw(c(1:2, 0L, 0L, 5L)), NULL, raw(1)))
})

test_that("can't insert objects of incorrect type", {
  x <- blob(!!!as.raw(1:5))

  expect_error(x[[1]] <- 1, class = "vctrs_error_incompatible", fixed = TRUE)
  expect_error(x[1] <- 1, class = "vctrs_error_incompatible", fixed = TRUE)
})

test_that("can insert raw or NULL", {
  x <- blob(!!!as.raw(1:4))

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
