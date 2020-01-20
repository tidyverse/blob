#' @export
format.blob <- function(x, ...) {
  if (length(x) == 0)
    return(character())

  ifelse(is.na(x), "<NA>", paste0("blob[", blob_size(x, ...), "]"))
}

#' @export
obj_print_data.blob <- function(x, ...) {
  if (length(x) == 0)
    return()

  out <- stats::setNames(format(x), names(x))
  print(out, quote = FALSE)

  invisible(x)
}

#' @export
vec_ptype_abbr.blob <- function(x) {
  "blob"
}

#' @export
vec_ptype_full.blob <- function(x) {
  "blob"
}

# Dynamically exported, see zzz.R
is_vector_s3.blob <- function(x) TRUE

blob_size <- function(x, digits = 3, trim = TRUE, ...) {
  x <- vapply(x, length, numeric(1))
  if (isTRUE(trim)) {
    pretty_bytes_nopad(x)
  } else {
    pretty_bytes_default(x)
  }
}

# Dynamically exported, see zzz.R
pillar_shaft.blob <- function(x, ...) {
  out <- ifelse(
    is.na(x),
    NA_character_,
    paste0(pillar::style_subtle("<raw "), blob_size(x, ...), pillar::style_subtle(">"))
  )

  pillar::new_pillar_shaft_simple(out, align = "right")
}
