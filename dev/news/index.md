# Changelog

## blob 1.2.99.9900 (2026-01-12)

### Bug fixes

- Fix argument consistency between S3 generics and methods.

### Chore

- Upkeep.

- Auto-update from GitHub Actions.

  Run: <https://github.com/tidyverse/blob/actions/runs/17451417258>

  Run: <https://github.com/tidyverse/blob/actions/runs/14636194825>

  Run: <https://github.com/tidyverse/blob/actions/runs/10425482785>

  Run: <https://github.com/tidyverse/blob/actions/runs/10200111385>

  Run: <https://github.com/tidyverse/blob/actions/runs/9728444615>

  Run: <https://github.com/tidyverse/blob/actions/runs/9691616480>

- Change maintainer e-mail.

### Continuous integration

- Install binaries from r-universe for dev workflow
  ([\#64](https://github.com/tidyverse/blob/issues/64)).

- Fix reviewdog and add commenting workflow
  ([\#63](https://github.com/tidyverse/blob/issues/63)).

- Use workflows for fledge
  ([\#62](https://github.com/tidyverse/blob/issues/62)).

- Sync ([\#61](https://github.com/tidyverse/blob/issues/61)).

- Use reviewdog for external PRs
  ([\#59](https://github.com/tidyverse/blob/issues/59)).

- Cleanup and fix macOS
  ([\#58](https://github.com/tidyverse/blob/issues/58)).

- Format with air, check detritus, better handling of `extra-packages`
  ([\#57](https://github.com/tidyverse/blob/issues/57)).

- Enhance permissions for workflow
  ([\#53](https://github.com/tidyverse/blob/issues/53)).

- Permissions, better tests for missing suggests, lints
  ([\#52](https://github.com/tidyverse/blob/issues/52)).

- Only fail covr builds if token is given
  ([\#51](https://github.com/tidyverse/blob/issues/51)).

- Always use `_R_CHECK_FORCE_SUGGESTS_=false`
  ([\#50](https://github.com/tidyverse/blob/issues/50)).

- Correct installation of xml2
  ([\#49](https://github.com/tidyverse/blob/issues/49)).

- Explain ([\#48](https://github.com/tidyverse/blob/issues/48)).

- Add xml2 for covr, print testthat results
  ([\#47](https://github.com/tidyverse/blob/issues/47)).

- Fix ([\#46](https://github.com/tidyverse/blob/issues/46)).

- Sync ([\#45](https://github.com/tidyverse/blob/issues/45)).

- Avoid failure in fledge workflow if no changes
  ([\#44](https://github.com/tidyverse/blob/issues/44)).

- Fetch tags for fledge workflow to avoid unnecessary NEWS entries
  ([\#43](https://github.com/tidyverse/blob/issues/43)).

- Use larger retry count for lock-threads workflow
  ([\#42](https://github.com/tidyverse/blob/issues/42)).

- Ignore errors when removing pkg-config on macOS
  ([\#41](https://github.com/tidyverse/blob/issues/41)).

- Explicit permissions
  ([\#40](https://github.com/tidyverse/blob/issues/40)).

- Use styler from main branch
  ([\#39](https://github.com/tidyverse/blob/issues/39)).

- Need to install R on Ubuntu 24.04
  ([\#38](https://github.com/tidyverse/blob/issues/38)).

- Use Ubuntu 24.04 and styler PR
  ([\#36](https://github.com/tidyverse/blob/issues/36)).

- Correctly detect branch protection
  ([\#35](https://github.com/tidyverse/blob/issues/35)).

- Use stable pak ([\#34](https://github.com/tidyverse/blob/issues/34)).

- Trigger run ([\#33](https://github.com/tidyverse/blob/issues/33)).

  - ci: Trigger run

  - ci: Latest changes

- Trigger run ([\#32](https://github.com/tidyverse/blob/issues/32)).

- Use pkgdown branch
  ([\#31](https://github.com/tidyverse/blob/issues/31)).

  - ci: Use pkgdown branch

  - ci: Updates from duckdb

- Install via R CMD INSTALL ., not pak
  ([\#30](https://github.com/tidyverse/blob/issues/30)).

  - ci: Install via R CMD INSTALL ., not pak

  - ci: Bump version of upload-artifact action

- Install local package for pkgdown builds.

- Improve support for protected branches with fledge.

- Improve support for protected branches, without fledge.

- Sync with latest developments.

- Use v2 instead of master.

- Inline action.

- Use dev roxygen2 and decor.

- Fix on Windows, tweak lock workflow.

- Avoid checking bashisms on Windows.

- Better commit message.

- Bump versions, better default, consume custom matrix.

- Recent updates.

### Testing

- Expand on `NULL` subassignment tests related to vctrs changes
  ([@DavisVaughan](https://github.com/DavisVaughan),
  [\#65](https://github.com/tidyverse/blob/issues/65)).

### Uncategorized

- Internal changes only.

- Merged cran-1.2.4 into main.

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
  [`new_blob()`](https://blob.tidyverse.org/dev/reference/blob.md)
  constructor permits safe and fast construction of `blob` objects from
  a list, and
  [`validate_blob()`](https://blob.tidyverse.org/dev/reference/blob.md)
  checks an existing object for conformity with the rules.

- The new
  [`is_blob()`](https://blob.tidyverse.org/dev/reference/blob.md)
  deprecates the existing `is.blob()`.
  [`as.blob()`](https://blob.tidyverse.org/dev/reference/as.blob.md) is
  deprecated in favor of `vec_cast()` or the new
  [`as_blob()`](https://blob.tidyverse.org/dev/reference/blob.md) (which
  is just a thin wrapper around `vec_cast()`).

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
