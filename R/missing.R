#' @export
is.na.blob <- function(x) {
  vapply(x, is.null, logical(1))
}

#' @export
`is.na<-.blob` <- function(x, value) {
  if (!is.logical(value) || length(x) != length(value)) {
    stop("RHS must be a logical the same length as `x`", call. = FALSE)
  }

  x[value] <- rep(list(NULL), sum(value))
  x
}
