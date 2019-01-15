# Required, because blob wraps a list, and the default implementation
# doesn't cast if the underlying type is a list.
#' @export
`[[<-.blob` <- function(x, i, ..., value) {
  if (!is.raw(value) && !is.null(value)) {
    stop("RHS must be raw vector or NULL", call. = FALSE)
  }

  if (is.null(value)) {
    # Setting to NULL via [[ shortens the list! Example:
    # `[[<-`(list(1), 1, NULL)
    x[i] <- list(NULL)
    x
  } else {
    NextMethod()
  }
}
