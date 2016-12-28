#' @export
format.blob <- function(x, ...) {
  if (length(x) == 0)
    return(character())

  ifelse(is.na(x), "<NA>", paste0("blob[", blob_size(x, ...) , "]"))
}

#' @export
print.blob <- function(x, ...) {
  if (length(x) == 0) {
    cat("blob()\n")
  } else {
    print(format(x, ...), quote = FALSE)
  }
}

#' @export
#' @importFrom tibble type_sum
type_sum.blob <- function(x) {
  "blob"
}

#' @export
#' @importFrom tibble obj_sum
obj_sum.blob <- function(x) {
  format(x, trim = FALSE)
}

#' @export
#' @importFrom tibble is_vector_s3
is_vector_s3.blob <- function(x) TRUE

blob_size <- function(x, digits = 3, trim = TRUE, ...) {
  x <- vapply(x, length, integer(1))

  power <- min(floor(log(abs(x), 1000)), 4)
  if (power < 1) {
    unit <- "B"
  } else {
    unit <- c("kb", "Mb", "Gb", "Tb")[[power]]
    x <- x / (1024 ^ power)
  }

  x1 <- signif(x, digits = digits %||% 3)
  x2 <- format(x1, big.mark = ",", scientific = FALSE, trim = trim)
  paste0(x2, " ", unit)
}
