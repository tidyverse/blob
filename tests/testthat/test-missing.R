context("missing")

test_that("is.na detects nulls", {
  x <- blob(as.raw(1), NULL, as.raw(2), NULL)
  expect_equal(is.na(x), c(FALSE, TRUE, FALSE, TRUE))
})

test_that("is.na<- sets missing values", {
  x <- as.blob(1:4)
  is.na(x) <- (1:4 %% 2 == 0)

  expect_equal(x, blob(as.raw(1), NULL, as.raw(3), NULL))
})
