# nocov start
.onLoad <- function(...) {
  s3_register("pillar::pillar_shaft", "blob")
  s3_register("pillar::is_vector_s3", "blob")

  invisible()
}
# nocov end
