context("test-cast")

test_that("casting with as.blob()", {
  # Deprecated in v1.2.0
  scoped_lifecycle_silence()

  expect_identical(as.blob(blob(raw(1))), blob(raw(1)))
  expect_identical(as.blob(list(raw(1))), blob(raw(1)))
  expect_identical(as.blob(raw(1)), blob(raw(1)))
  expect_identical(as.blob(1:3), blob(as.raw(1), as.raw(2), as.raw(3)))
  expect_identical(as.blob(c("abc", "def")), blob(charToRaw("abc"), charToRaw("def")))
})

test_that("casting with as_blob()", {
  expect_identical(as_blob(blob(raw(1))), blob(raw(1)))
  expect_identical(as_blob(list(raw(1))), blob(raw(1)))
  expect_identical(as_blob(raw(1)), blob(raw(1)))
  expect_identical(blob(!!!as.raw(1:3)), blob(as.raw(1), as.raw(2), as.raw(3)))
  expect_identical(as_blob(c("abc", "def")), blob(charToRaw("abc"), charToRaw("def")))
})
