# Deprecated generic

The `as.blob()` generic has been deprecated in favor of the
[`as_blob()`](https://blob.tidyverse.org/reference/blob.md) function
(for users) and the
[`vec_cast.blob()`](https://blob.tidyverse.org/reference/vec_cast.blob.md)
method (for implementers). Implement a `vec_cast.blob.myclass()` method
to support coercing objects of your class to blobs. See
[`vctrs::vec_cast()`](https://vctrs.r-lib.org/reference/vec_cast.html)
for more detail.

## Usage

``` r
as.blob(x, ...)
```

## Arguments

- x:

  An object.

- ...:

  Passed on to methods.
