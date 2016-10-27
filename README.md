
<!-- README.md is generated from README.Rmd. Please edit that file -->
blob
====

The goal of blob is to provide a simple S3 class to represent a vector of binary objects, aka blobs. The `blob` class is a lightweight wrapper around a list of raw vectors, suitable for inclusion in a data frame.

Installation
------------

You can install blob from github with:

``` r
# install.packages("devtools")
devtools::install_github("hadley/blob")
```

Example
-------

To create a blob, use `blob()`, `new_blob()` or `as.blob()`:

``` r
x1 <- charToRaw("Good morning")
x2 <- as.raw(c(0x48, 0x65, 0x6c, 0x6c, 0x6f))

new_blob(list(x1, x2))
#> [1] blob[12 B] blob[5 B]
blob(x1, x2)
#> [1] blob[12 B] blob[5 B]

as.blob(c("Good morning", "Good evening"))
#> [1] blob[12 B] blob[12 B]
```
