context("construction")

test_that("input must be list of raw blobs", {
  # error from vctrs package
  expect_error(new_blob(1))
  expect_error(blob(1), "must be a list of raw vectors")
  expect_error(blob(1, as.raw(1)), "must be a list of raw vectors")
})
