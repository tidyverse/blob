# nocov start
.onLoad <- function(...) {
  s3_register("pillar::pillar_shaft", "blob")
  s3_register("pillar::is_vector_s3", "blob")

  if (utils::packageVersion("vctrs") <= "0.1.0") {
    vec_default_cast <<- vec_default_cast_old
  } else {
    rm("vec_default_cast", inherits = TRUE)
  }

  invisible()
}
# nocov end
