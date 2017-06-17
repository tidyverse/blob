context("format")

expect_format_equal <- function(formatted, result) {
  expect_equal(
    paste(formatted, collapse = "\n"),
    paste(result, collapse = "\n")
  )
}

test_that("unequal sizes", {
  x <- blob(raw(2 ** 2), raw(2 ** 11), raw(2 ** 20))

  expect_format_equal(
    format(x),
    c(
      "blob[4 B]",
      "blob[2,050 B]",
      "blob[1,050,000 B]"
    )
  )

  expect_format_equal(
    format(x, trim = FALSE),
    c(
      "blob[        4 B]",
      "blob[    2,050 B]",
      "blob[1,050,000 B]"
    )
  )
})

test_that("similar sizes", {
  x <- blob(raw(2 ** 10), raw(2 ** 11), raw(2 ** 12))

  expect_format_equal(
    format(x),
    c(
      "blob[1 kb]",
      "blob[2 kb]",
      "blob[4 kb]"
    )
  )
})
