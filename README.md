
[![Travis-CI Build Status](https://travis-ci.org/rstats-db/blob.svg?branch=master)](https://travis-ci.org/rstats-db/blob) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/blob)](https://cran.r-project.org/package=blob) [![Coverage Status](https://img.shields.io/codecov/c/github/rstats-db/blob/master.svg)](https://codecov.io/github/rstats-db/blob?branch=master)

<!-- README.md is generated from README.Rmd. Please edit that file -->
blob
====

The goal of blob is to provide a simple S3 class to represent a vector of binary objects, aka blobs. The `blob` class is a lightweight wrapper around a list of raw vectors, suitable for inclusion in a data frame.

In most cases you will not need to use this package explicitly: it will be used transparently by packages that need to load BLOB columns from databases or binary file formats.

Installation
------------

You can install blob from github with:

``` r
# install.packages("devtools")
devtools::install_github("rstats-db/blob")
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
