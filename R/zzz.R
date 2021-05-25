# nocov start
.onLoad <- function(...) {
  s3_register("pillar::pillar_shaft", "blob")

  invisible()
}
# nocov end
