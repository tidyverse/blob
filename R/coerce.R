#' Coercion
#'
#' Double dispatch methods to support [vctrs::vec_type2()].
#'
#' @inheritParams vctrs::vec_type2
#'
#' @method vec_type2 vctrs_blob
#' @export
#' @export vec_type2.vctrs_blob
vec_type2.vctrs_blob <- function(x, y) UseMethod("vec_type2.vctrs_blob", y)

#' @method vec_type2.vctrs_blob default
#' @export
vec_type2.vctrs_blob.default <- function(x, y) stop_incompatible_type(x, y)

#' @method vec_type2.vctrs_blob vctrs_blob
#' @export
vec_type2.vctrs_blob.vctrs_blob <- function(x, y) {
  new_blob(list())
}

#' @method vec_type2.vctrs_blob vctrs_unspecified
#' @export
vec_type2.vctrs_blob.vctrs_unspecified <- function(x, y) x

#' @method vec_type2.vctrs_blob list
#' @export
vec_type2.vctrs_blob.list <- function(x, y) {
  check_raw_list(y)
  new_blob(list())
}

#' @method vec_type2.list vctrs_blob
#' @export
vec_type2.list.vctrs_blob <- function(x, y) {
  check_raw_list(x)
  new_blob(list())
}
