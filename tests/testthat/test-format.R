context("format")

expect_format_equal <- function(formatted, result) {
  expect_equal(
    paste(formatted, collapse = "\n"),
    paste(result, collapse = "\n")
  )
}

test_that("unequal sizes", {
  skip_on_cran()

  x <- blob(raw(2**2), raw(2**11), raw(2**20))

  expect_format_equal(
    format(x),
    c(
      "blob[4 B]",
      "blob[2.05 kB]",
      "blob[1.05 MB]"
    )
  )

  expect_format_equal(
    format(x, trim = FALSE),
    c(
      "blob[    4 B]",
      "blob[2.05 kB]",
      "blob[1.05 MB]"
    )
  )
})

test_that("similar sizes", {
  skip_on_cran()

  x <- blob(raw(2**10), raw(2**11), raw(2**12))

  expect_format_equal(
    format(x),
    c(
      "blob[1.02 kB]",
      "blob[2.05 kB]",
      "blob[4.10 kB]"
    )
  )
})

test_that("empty", {
  x <- blob()

  expect_format_equal(
    format(x),
    character()
  )
})

test_that("output", {
  skip_on_cran()

  x <- blob(raw(2**2), raw(2**11), raw(2**20))

  expect_known_output(print(x), "blob.txt")
})
