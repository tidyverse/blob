#' @import vctrs
#' @import rlang
NULL

#' @importFrom methods setOldClass
setOldClass(c("blob", "vctrs_list_of", "vctrs_vctr"))

#' Construct a blob object
#'
#' `new_blob()` is a low-level constructor that takes a list of
#' raw vectors.
#' `blob()` constructs a blob from individual raw vectors.
#' `as_blob()` and `is_blob()` are simple forwarders to [vctrs::vec_cast()]
#' and [inherits()], respectively.
#'
#' @seealso [as.blob()] for the legacy interface for specifying casts.
#'
#' @param ... Individual raw vectors
#' @param x A list of raw vectors, or other object to coerce
#' @export
#' @examples
#' x1 <- charToRaw("Good morning")
#' x2 <- as.raw(c(0x48, 0x65, 0x6c, 0x6c, 0x6f))
#'
#' new_blob(list(x1, x2))
#' blob(x1, x2)
#'
#' as.blob(c("Good morning", "Good evening"))
blob <- function(...) {
  x <- list2(...)
  validate_blob(x)
  new_blob(x)
}

#' @export
#' @rdname blob
new_blob <- function(x = list()) {
  new_list_of(x, ptype = raw(), class = "blob")
}

#' @export
#' @rdname blob
validate_blob <- function(x) {
  x_arg <- as_label(enexpr(x))
  check_raw_list(x, x_arg)
}

check_raw_list <- function(x, x_arg) {
  if (!is_raw_list(x)) {
    stop("`", x_arg, "` must be a list of raw vectors", call. = FALSE)
  }
}

#' @export
#' @rdname blob
as_blob <- function(x) {
  vec_cast(x, new_blob())
}

#' @export
#' @rdname blob
is_blob <- function(x) {
  vec_is(x, new_blob())
}

#' Deprecated generic
#'
#' The `as.blob()` generic has been deprecated in favor of
#' the [as_blob()] function (for users) and the [vec_cast.blob()] method
#' (for implementers).
#' Implement a `vec_cast.blob.myclass()` method to support
#' coercing objects of your class to blobs.
#' See [vctrs::vec_cast()] for more detail.
#'
#' @param x An object.
#' @param ... Passed on to methods.
#'
#' @export
#' @keywords internal
as.blob <- function(x, ...) {
  signal_soft_deprecated("as.blob() is deprecated, use as_blob().")
  UseMethod("as.blob")
}

#' @export
as.blob.default <- function(x, ...) {
  as_blob(x)
}
