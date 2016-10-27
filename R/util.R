is_raw_list <- function(x) {
  if (!is.list(x))
    return(FALSE)

  all_raw <- all(vapply(x, is.raw, logical(1)))
  if (!all_raw)
    return(FALSE)

  TRUE
}
