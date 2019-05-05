#' Coercion
#'
#' Double dispatch methods to support [vctrs::vec_type2()].
#'
#' @inheritParams vctrs::vec_type2
#'
#' @method vec_type2 blob
#' @export
#' @export vec_type2.blob
vec_type2.blob <- function(x, y, ..., x_arg = "", y_arg = "") UseMethod("vec_type2.blob", y)

#' @method vec_type2.blob default
#' @export
vec_type2.blob.default <- function(x, y, ..., x_arg = "", y_arg = "") stop_incompatible_type(x, y, x_arg, y_arg)

#' @method vec_type2.blob blob
#' @export
vec_type2.blob.blob <- function(x, y, ...) {
  new_blob(list())
}

#' @method vec_type2.blob vctrs_unspecified
#' @export
vec_type2.blob.vctrs_unspecified <- function(x, y, ...) x

#' @method vec_type2.blob list
#' @export
vec_type2.blob.list <- function(x, y, ..., x_arg = "", y_arg = "") {
  check_raw_list(y, y_arg)
  new_blob(list())
}

#' @method vec_type2.list blob
#' @export
vec_type2.list.blob <- function(x, y, ..., x_arg = "", y_arg = "") {
  check_raw_list(x, x_arg)
  new_blob(list())
}
