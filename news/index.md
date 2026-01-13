# Changelog

## blob 1.3.0 (2026-01-13)

### fledge

- CRAN pre-release v1.2.99.9900
  ([\#66](https://github.com/tidyverse/blob/issues/66)).

### Bug fixes

- Fix argument consistency between S3 generics and methods.

### Chore

- NEWS.

- Upkeep ([@MikeJohnPage](https://github.com/MikeJohnPage),
  [\#55](https://github.com/tidyverse/blob/issues/55)).

### Continuous integration

- Fix comment ([\#69](https://github.com/tidyverse/blob/issues/69)).

- Tweaks ([\#68](https://github.com/tidyverse/blob/issues/68)).

- Test all R versions on branches that start with cran-
  ([\#67](https://github.com/tidyverse/blob/issues/67)).

### Testing

- The upcoming vctrs update changes details on how subset assignment
  with `NULL` works. This motivated the minor version bump
  ([@DavisVaughan](https://github.com/DavisVaughan),
  [\#65](https://github.com/tidyverse/blob/issues/65)).

## blob 1.2.4 (2023-03-17)

CRAN release: 2023-03-17

### Bug fixes

- Fix argument consistency between S3 generics and methods.

## blob 1.2.3 (2022-04-10)

CRAN release: 2022-04-10

- `as_blob(NA_character_)` returns a missing `blob` instead of
  `as_blob("NA")` ([\#26](https://github.com/tidyverse/blob/issues/26),
  [@michaelchirico](https://github.com/michaelchirico)).

## blob 1.2.2 (2021-07-23)

CRAN release: 2021-07-23

- Moved to “stable” lifecycle stage.
- Remove `is_vector_s3()`
  ([\#19](https://github.com/tidyverse/blob/issues/19)).

## blob 1.2.1

CRAN release: 2020-01-20

- Inline prettyunits.
- `vec_ptype2.hms.default()` forwards to `vec_default_ptype2()` for
  compatibility with vctrs 0.2.1.

## blob 1.2.0

CRAN release: 2019-07-09

### Breaking changes

- The `blob` class is now based on `list_of(raw())` from the vctrs
  package ([\#11](https://github.com/tidyverse/blob/issues/11)). This
  adds support for `vec_cast()` and `vec_ptype2()`. Some operations
  (such as subset assignment) are now stricter. The
  [`new_blob()`](https://blob.tidyverse.org/reference/blob.md)
  constructor permits safe and fast construction of `blob` objects from
  a list, and
  [`validate_blob()`](https://blob.tidyverse.org/reference/blob.md)
  checks an existing object for conformity with the rules.

- The new [`is_blob()`](https://blob.tidyverse.org/reference/blob.md)
  deprecates the existing `is.blob()`.
  [`as.blob()`](https://blob.tidyverse.org/reference/as.blob.md) is
  deprecated in favor of `vec_cast()` or the new
  [`as_blob()`](https://blob.tidyverse.org/reference/blob.md) (which is
  just a thin wrapper around `vec_cast()`).

- Indexing a vector of blobs out of bounds now raises an error. Use `NA`
  as index to create a `NULL` blob.

## blob 1.1.1 (2018-03-24)

CRAN release: 2018-03-25

- Now suggesting *pillar* instead of importing *tibble*, and using
  colored formatting with the *prettyunits* package with `B` instead of
  `b` as units ([\#7](https://github.com/tidyverse/blob/issues/7),
  [\#9](https://github.com/tidyverse/blob/issues/9)).

- The blob class can now be used for S4 dispatch.

- Calling [`c()`](https://rdrr.io/r/base/c.html) on blob objects returns
  a blob.

## blob 1.1.0 (2017-06-17)

CRAN release: 2017-06-17

- New maintainer: Kirill Müller.

- Added `as.blob.blob()`and `as.data.frame.blob()` methods
  ([\#3](https://github.com/tidyverse/blob/issues/3)).

- Size of very large blobs is displayed correctly.

## blob 1.0.0

CRAN release: 2016-12-28

- Initial release.
