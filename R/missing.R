# No implementation in vctrs 0.1.0
#' @export
`is.na<-.blob` <- function(x, value) {
  if (!is.logical(value) || length(x) != length(value)) {
    stop("RHS must be a logical the same length as `x`", call. = FALSE)
  }

  x[value] <- list(NULL)
  x
}
