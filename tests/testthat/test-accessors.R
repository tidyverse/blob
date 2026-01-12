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

test_that("can insert raw", {
  x <- blob(!!!as.raw(1:2))

  x[[1]] <- as.raw(0)
  x[2] <- list(as.raw(0))

  expect_equal(x, blob(as.raw(0), as.raw(0)))
})

test_that("`[<-` can insert missing values", {
  # With `list(NULL)`
  x <- blob(raw(1), raw(2), raw(3))
  x[c(1, 3)] <- list(NULL)
  expect_identical(x, blob(NULL, raw(2), NULL))

  # With `blob(NULL)`
  x <- blob(raw(1), raw(2), raw(3))
  x[c(1, 3)] <- blob(NULL)
  expect_identical(x, blob(NULL, raw(2), NULL))
})

test_that("`[<-` shrinks the blob when inserting literal `NULL`", {
  # Because <blob> is implemented on <list_of> and inherits all list-like
  # qualities, for better or worse

  # `<list_of>` method threw an incomprehensible error before this
  skip_if_not_installed("vctrs", "0.6.5.9000")

  x <- blob(raw(1), raw(2))
  x[1] <- NULL
  expect_identical(x, blob(raw(2)))

  x <- blob(raw(1), raw(2), raw(3))
  x[2:3] <- NULL
  expect_identical(x, blob(raw(1)))

  # By name
  x <- blob(a = raw(1), b = raw(2), c = raw(3))
  x[c("b", "c")] <- NULL
  expect_identical(x, blob(a = raw(1)))

  # OOB
  x <- blob(raw(1))
  x[2] <- NULL
  expect_identical(x, blob(raw(1)))
})

test_that("`[[<-` shrinks the blob when inserting literal `NULL`", {
  # Because <blob> is implemented on <list_of> and inherits all list-like
  # qualities, for better or worse

  # `<list_of>` avoided shrinking the list before this, but we've changed that
  # to better align with base R lists
  skip_if_not_installed("vctrs", "0.6.5.9000")

  x <- blob(raw(1), raw(2))
  x[[1]] <- NULL
  expect_identical(x, blob(raw(2)))

  x <- blob(a = raw(1), b = raw(2), c = raw(3))
  x[["b"]] <- NULL
  expect_identical(x, blob(a = raw(1), c = raw(3)))

  # OOB
  x <- blob(raw(1))
  x[[2]] <- NULL
  expect_identical(x, blob(raw(1)))
})

test_that("`$<-` shrinks the blob when inserting literal `NULL`", {
  # Because <blob> is implemented on <list_of> and inherits all list-like
  # qualities, for better or worse

  x <- blob(a = raw(1), b = raw(2), c = raw(3))
  x$b <- NULL
  expect_identical(x, blob(a = raw(1), c = raw(3)))

  # OOB
  x <- blob(a = raw(1))
  x$b <- NULL
  expect_identical(x, blob(a = raw(1)))
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
