check_blob <- function(x) {
  if (!is.list(x) || !all(vapply(x, is.raw, logical(1)))) {
    stop("`x` must be a list of raw vectors", call. = FALSE)
  }
}
