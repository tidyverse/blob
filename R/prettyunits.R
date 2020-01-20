compute_bytes <- function(bytes, smallest_unit = "B") {
  units0 <- c("B", "kB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB")

  stopifnot(
    is.numeric(bytes),
    is.character(smallest_unit),
    length(smallest_unit) == 1,
    !is.na(smallest_unit),
    smallest_unit %in% units0
  )

  negative <- (bytes < 0)
  bytes <- abs(bytes)
  smallest_idx <- match(smallest_unit, units0)

  limits <- c(1000, 999950 * 1000 ^ (seq_len(length(units0) - 2) - 1))
  idx <- cut(bytes, c(0, limits, Inf), labels = FALSE, right = FALSE)
  idx <- pmax(idx, smallest_idx)

  amount <- bytes / signif(c(1, limits), 1)[idx]
  idx[is.na(idx)] <- smallest_idx
  unit <- units0[idx]

  data.frame(
    stringsAsFactors = FALSE,
    amount,
    unit,
    negative
  )
}

pretty_bytes_default <- function(bytes) {
  szs <- compute_bytes(bytes)
  amt <- szs$amount * ifelse(szs$negative, -1, 1)

  is_int <- is.na(amt) | amt == as.integer(amt)

  ## String. For fractions we always show two fraction digits
  res <- ifelse(
    is_int,
    sprintf("%.0f%s", amt, ifelse(all(is_int) | (szs$unit == "B"), "", "   ")),
    sprintf("%.2f", amt)
  )

  format(paste(res, szs$unit), justify = "right")
}

pretty_bytes_nopad <- function(bytes) {
  sub("^\\s+", "", pretty_bytes_default(bytes))
}
