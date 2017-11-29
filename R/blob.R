#' @importFrom methods setOldClass
setOldClass("blob")

#' Construct a blob object
#'
#' \code{new_blob} is a low-level constructor that takes a list of
#' raw vectors. \code{blob} constructs a blob from individual raw vectors,
#' and \code{as.blob} is a S3 generic that converts existing objects.
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
  new_blob(list(...))
}

#' @export
#' @rdname blob
new_blob <- function(x) {
  if (!is_raw_list(x)) {
    stop("`x` must be a list of raw vectors", call. = FALSE)
  }
  structure(x, class = "blob")
}

#' @export
#' @rdname blob
as.blob <- function(x, ...) {
  UseMethod("as.blob")
}

#' @export
as.blob.blob <- function(x, ...) {
  x
}

#' @export
as.blob.list <- function(x, ...) {
  new_blob(x)
}

#' @export
as.blob.raw <- function(x, ...) {
  new_blob(list(x))
}

#' @export
as.blob.character <- function(x, ...) {
  new_blob(lapply(x, charToRaw))
}

#' @export
as.blob.integer <- function(x, ...) {
  new_blob(lapply(x, as.raw))
}

#' @export
as.data.frame.blob <- as.data.frame.difftime
