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
  if (!is.raw(value) && !is.null(value)) {
    stop("RHS must be raw vector or NULL", call. = FALSE)
  }

  if (is.null(value)) {
    x[i] <- list(NULL)
    x
  } else {
    NextMethod()
  }
}

#' @export
c.blob <- function(x, ...) as.blob(NextMethod())
