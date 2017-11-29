#' @export
format.blob <- function(x, ...) {
  if (length(x) == 0)
    return(character())

  ifelse(is.na(x), "<NA>", paste0("blob[", blob_size(x, ...), "]"))
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
#' @importFrom pillar type_sum
type_sum.blob <- function(x) {
  "blob"
}

#' @export
#' @importFrom pillar obj_sum
obj_sum.blob <- function(x) {
  format(x, trim = FALSE)
}

#' @export
#' @importFrom pillar is_vector_s3
is_vector_s3.blob <- function(x) TRUE

blob_size <- function(x, digits = 3, trim = TRUE, ...) {
  x <- vapply(x, length, numeric(1))

  units <- c("kb", "Mb", "Gb", "Tb")
  power <- min(floor(log(abs(x), 1000)), length(units))
  if (power < 1) {
    unit <- "B"
  } else {
    unit <- units[[power]]
    x <- x / (1024 ^ power)
  }

  x1 <- signif(x, digits = digits %||% 3)
  x2 <- format(x1, big.mark = ",", scientific = FALSE, trim = trim)
  paste0(x2, " ", unit)
}

#' @importFrom pillar pillar_shaft
#' @export
pillar_shaft.blob <- function(x, ...) {
  out <- ifelse(
    is.na(x),
    NA_character_,
    paste0(pillar::style_subtle("["), blob_size(x, ...), pillar::style_subtle("]"))
  )

  pillar::new_pillar_shaft_simple(out, align = "right")
}
