# Construct a blob object

`new_blob()` is a low-level constructor that takes a list of raw
vectors. `blob()` constructs a blob from individual raw vectors.
`as_blob()` and `is_blob()` are simple forwarders to
[`vctrs::vec_cast()`](https://vctrs.r-lib.org/reference/vec_cast.html)
and [`inherits()`](https://rdrr.io/r/base/class.html), respectively.

## Usage

``` r
blob(...)

new_blob(x = list())

validate_blob(x)

as_blob(x)

is_blob(x)
```

## Arguments

- ...:

  Individual raw vectors

- x:

  A list of raw vectors, or other object to coerce

## See also

[`as.blob()`](https://blob.tidyverse.org/reference/as.blob.md) for the
legacy interface for specifying casts.

## Examples

``` r
x1 <- charToRaw("Good morning")
x2 <- as.raw(c(0x48, 0x65, 0x6c, 0x6c, 0x6f))

new_blob(list(x1, x2))
#> <blob[2]>
#> [1] blob[12 B] blob[5 B] 
blob(x1, x2)
#> <blob[2]>
#> [1] blob[12 B] blob[5 B] 

as.blob(c("Good morning", "Good evening"))
#> Warning: as.blob() is deprecated, use as_blob().
#> This warning is displayed once per session.
#> <blob[2]>
#> [1] blob[12 B] blob[12 B]
```
