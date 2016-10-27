context("construction")

test_that("input must be list of raw blobs", {
  expect_error(new_blob(1), "must be a list of raw vectors")
  expect_error(new_blob(list(1)), "must be a list of raw vectors")
  expect_error(new_blob(list(1, as.raw(1))), "must be a list of raw vectors")
})
