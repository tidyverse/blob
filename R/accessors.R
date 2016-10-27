#' @export
`[.blob` <- function(x, i, ...) {
  new_blob(NextMethod())
}

#' @export
`[<-.blob` <- function(x, i, ..., value) {
  if (!is_raw_list(value)) {
    stop("RHS must be list of raw vectors", call. = FALSE)
  }

  NextMethod()
}

#' @export
`[[<-.blob` <- function(x, i, ..., value) {
  if (!is.raw(value)) {
    stop("RHS must be raw vector", call. = FALSE)
  }

  NextMethod()
}
