#' Casting
#'
#' Double dispatch methods to support [vctrs::vec_cast()].
#'
#' @inheritParams vctrs::vec_cast
#'
#' @method vec_cast vctrs_blob
#' @export
#' @export vec_cast.vctrs_blob
vec_cast.vctrs_blob <- function(x, to) UseMethod("vec_cast.vctrs_blob")

#' @method vec_cast.vctrs_blob default
#' @export
vec_cast.vctrs_blob.default <- function(x, to) stop_incompatible_cast(x, to)

#' @method vec_cast.vctrs_blob logical
#' @export
vec_cast.vctrs_blob.logical <- function(x, to) vec_unspecified_cast(x, to)

#' @method vec_cast.vctrs_blob vctrs_blob
#' @export
vec_cast.vctrs_blob.vctrs_blob <- function(x, to) x

#' @method vec_cast.vctrs_blob list
#' @export
vec_cast.vctrs_blob.list <- function(x, to) blob(!!!x)

#' @method vec_cast.vctrs_blob integer
#' @export
vec_cast.vctrs_blob.integer <- function(x, to) blob(!!!lapply(x, as.raw))

#' @method vec_cast.vctrs_blob raw
#' @export
vec_cast.vctrs_blob.raw <- function(x, to) blob(x)

#' @method vec_cast.vctrs_blob character
#' @export
vec_cast.vctrs_blob.character <- function(x, to) blob(!!!lapply(x, charToRaw))

#' @method vec_cast.list vctrs_blob
#' @export
vec_cast.list.vctrs_blob <- function(x, to) vec_data(x)
