context("test-cast")

test_that("casting with as.blob()", {
  expect_identical(as.blob(blob(raw(1))), blob(raw(1)))
  expect_identical(as.blob(list(raw(1))), blob(raw(1)))
  expect_identical(as.blob(raw(1)), blob(raw(1)))
  expect_identical(as.blob(1:3), blob(as.raw(1), as.raw(2), as.raw(3)))
  expect_identical(as.blob(c("abc", "def")), blob(charToRaw("abc"), charToRaw("def")))
})
