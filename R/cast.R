#' Casting
#'
#' Double dispatch methods to support [vctrs::vec_cast()].
#'
#' @inheritParams vctrs::vec_cast
#'
#' @keywords internal
#' @method vec_cast blob
#' @export
#' @export vec_cast.blob
vec_cast.blob <- function(x, to, ...) UseMethod("vec_cast.blob")

#' @method vec_cast.blob default
#' @export
vec_cast.blob.default <- function(x, to, ...) vec_default_cast(x, to, ...)

#' @method vec_cast.blob blob
#' @export
vec_cast.blob.blob <- function(x, to, ...) x

#' @method vec_cast.blob list
#' @export
vec_cast.blob.list <- function(x, to, ...) blob(!!!x)

#' @method vec_cast.blob vctrs_list_of
#' @export
vec_cast.blob.vctrs_list_of <- function(x, to, ...) {
  new_blob(vec_cast(x, new_list_of(ptype = raw())))
}

#' @method vec_cast.blob integer
#' @export
vec_cast.blob.integer <- function(x, to, ...) {
  signal_soft_deprecated("Coercing an integer vector to a blob is deprecated, please coerce to a list first.")
  blob(!!!lapply(x, as_single_raw))
}

#' @method vec_cast.blob raw
#' @export
vec_cast.blob.raw <- function(x, to, ...) blob(x)

#' @method vec_cast.blob character
#' @export
vec_cast.blob.character <- function(x, to, ...) blob(!!!lapply(x, charToRaw))
