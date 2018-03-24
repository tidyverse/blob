#' @export
format.blob <- function(x, ...) {
  if (length(x) == 0)
    return(character())

  ifelse(is.na(x), "<NA>", paste0("blob[", blob_size(x, ...), "]"))
}

#' @export
print.blob <- function(x, ...) {
  if (length(x) == 0) {
    cat("blob()\n")
  } else {
    print(format(x, ...), quote = FALSE)
  }
}

# Dynamically exported, see zzz.R
type_sum.blob <- function(x) {
  "blob"
}

# Dynamically exported, see zzz.R
obj_sum.blob <- function(x) {
  format(x, trim = FALSE)
}

# Dynamically exported, see zzz.R
is_vector_s3.blob <- function(x) TRUE

blob_size <- function(x, digits = 3, trim = TRUE, ...) {
  x <- vapply(x, length, numeric(1))
  prettyunits::pretty_bytes(x)
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
