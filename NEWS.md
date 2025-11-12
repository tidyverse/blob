<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->

# blob 1.2.4.9018 (2025-11-12)

## Continuous integration

- Fix reviewdog and add commenting workflow (#63).


# blob 1.2.4.9017 (2025-11-10)

## Chore

- Auto-update from GitHub Actions.

  Run: https://github.com/tidyverse/blob/actions/runs/17451417258

- Auto-update from GitHub Actions.

  Run: https://github.com/tidyverse/blob/actions/runs/14636194825

## Continuous integration

- Use workflows for fledge (#62).

- Sync (#61).

- Use reviewdog for external PRs (#59).

- Cleanup and fix macOS (#58).

- Format with air, check detritus, better handling of `extra-packages` (#57).

- Enhance permissions for workflow (#53).

- Permissions, better tests for missing suggests, lints (#52).

- Only fail covr builds if token is given (#51).

- Always use `_R_CHECK_FORCE_SUGGESTS_=false` (#50).

- Correct installation of xml2 (#49).

- Explain (#48).

- Add xml2 for covr, print testthat results (#47).

- Fix (#46).

- Sync (#45).


# blob 1.2.4.9016 (2024-12-09)

## Continuous integration

- Avoid failure in fledge workflow if no changes (#44).


# blob 1.2.4.9015 (2024-12-08)

## Continuous integration

- Fetch tags for fledge workflow to avoid unnecessary NEWS entries (#43).


# blob 1.2.4.9014 (2024-12-07)

## Continuous integration

- Use larger retry count for lock-threads workflow (#42).


# blob 1.2.4.9013 (2024-11-28)

## Continuous integration

- Ignore errors when removing pkg-config on macOS (#41).


# blob 1.2.4.9012 (2024-11-27)

## Continuous integration

- Explicit permissions (#40).


# blob 1.2.4.9011 (2024-11-26)

## Continuous integration

- Use styler from main branch (#39).


# blob 1.2.4.9010 (2024-11-25)

## Continuous integration

- Need to install R on Ubuntu 24.04 (#38).

- Use Ubuntu 24.04 and styler PR (#36).


# blob 1.2.4.9009 (2024-11-22)

## Continuous integration

  - Correctly detect branch protection (#35).


# blob 1.2.4.9008 (2024-11-18)

## Continuous integration

  - Use stable pak (#34).


# blob 1.2.4.9007 (2024-11-11)

## Continuous integration

  - Trigger run (#33).
    
      - ci: Trigger run
    
      - ci: Latest changes


# blob 1.2.4.9006 (2024-10-28)

## Continuous integration

  - Trigger run (#32).

  - Use pkgdown branch (#31).
    
      - ci: Use pkgdown branch
    
      - ci: Updates from duckdb


# blob 1.2.4.9005 (2024-09-15)

## Continuous integration

  - Install via R CMD INSTALL ., not pak (#30).
    
      - ci: Install via R CMD INSTALL ., not pak
    
      - ci: Bump version of upload-artifact action


# blob 1.2.4.9004 (2024-08-31)

## Chore

  - Auto-update from GitHub Actions.
    
    Run: https://github.com/tidyverse/blob/actions/runs/10425482785

  - Auto-update from GitHub Actions.
    
    Run: https://github.com/tidyverse/blob/actions/runs/10200111385

  - Auto-update from GitHub Actions.
    
    Run: https://github.com/tidyverse/blob/actions/runs/9728444615

  - Auto-update from GitHub Actions.
    
    Run: https://github.com/tidyverse/blob/actions/runs/9691616480

## Continuous integration

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


# blob 1.2.4.9003 (2023-10-09)

- Internal changes only.


# blob 1.2.4.9002 (2023-03-24)

- Merged cran-1.2.4 into main.


# blob 1.2.4.9001 (2023-03-23)

- Internal changes only.


# blob 1.2.4.9000 (2023-03-17)

## Bug fixes

- Fix argument consistency between S3 generics and methods.

## Chore

- Change maintainer e-mail.


# blob 1.2.4 (2023-03-17)

## Bug fixes

- Fix argument consistency between S3 generics and methods.


# blob 1.2.3 (2022-04-10)

- `as_blob(NA_character_)` returns a missing `blob` instead of `as_blob("NA")` (#26, @michaelchirico).


# blob 1.2.2 (2021-07-23)

- Moved to "stable" lifecycle stage.
- Remove `is_vector_s3()` (#19).


# blob 1.2.1

- Inline prettyunits.
- `vec_ptype2.hms.default()` forwards to `vec_default_ptype2()` for compatibility with vctrs 0.2.1.


# blob 1.2.0

## Breaking changes

- The `blob` class is now based on `list_of(raw())` from the vctrs package (#11). This adds support for `vec_cast()` and `vec_ptype2()`. Some operations (such as subset assignment) are now stricter. The `new_blob()` constructor permits safe and fast construction of `blob` objects from a list, and `validate_blob()` checks an existing object for conformity with the rules.

- The new `is_blob()` deprecates the existing `is.blob()`. `as.blob()` is deprecated in favor of `vec_cast()` or the new `as_blob()` (which is just a thin wrapper around `vec_cast()`).

- Indexing a vector of blobs out of bounds now raises an error. Use `NA` as index to create a `NULL` blob.


# blob 1.1.1 (2018-03-24)

- Now suggesting *pillar* instead of importing *tibble*, and using colored
  formatting with the *prettyunits* package with `B` instead of `b` as units
  (#7, #9).

- The blob class can now be used for S4 dispatch.

- Calling `c()` on blob objects returns a blob.


# blob 1.1.0 (2017-06-17)

- New maintainer: Kirill Müller.

- Added `as.blob.blob()`and `as.data.frame.blob()` methods (#3).

- Size of very large blobs is displayed correctly.


# blob 1.0.0

- Initial release.
