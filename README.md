<!-- badges: start -->

[![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable) [![rcc](https://github.com/tidyverse/blob/workflows/rcc/badge.svg)](https://github.com/tidyverse/blob/actions) [![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/blob)](https://cran.r-project.org/package=blob) [![Coverage Status](https://codecov.io/gh/tidyverse/blob/branch/main/graph/badge.svg)](https://codecov.io/github/tidyverse/blob?branch=main)

<!-- badges: end -->

<!-- README.md is generated from README.Rmd. Please edit that file -->

# blob

## Overview

The goal of blob is to provide a simple S3 class to represent a vector of binary objects, aka blobs. The `blob` class is a lightweight wrapper around a list of raw vectors, suitable for inclusion in a data frame.

In most cases you will not need to use this package explicitly: it will be used transparently by packages that need to load BLOB columns from databases or binary file formats.

## Installation

<pre class='chroma'>
<span class='c'># The easiest way to get blob is to install the whole tidyverse:</span>
<span class='nf'><a href='https://rdrr.io/r/utils/install.packages.html'>install.packages</a></span><span class='o'>(</span><span class='s'>"tidyverse"</span><span class='o'>)</span>

<span class='c'># Alternatively, install just blob:</span>
<span class='nf'><a href='https://rdrr.io/r/utils/install.packages.html'>install.packages</a></span><span class='o'>(</span><span class='s'>"blob"</span><span class='o'>)</span>

<span class='c'># Or the the development version from GitHub:</span>
<span class='c'># install.packages("devtools")</span>
<span class='nf'>devtools</span><span class='nf'>::</span><span class='nf'><a href='https://devtools.r-lib.org//reference/remote-reexports.html'>install_github</a></span><span class='o'>(</span><span class='s'>"tidyverse/blob"</span><span class='o'>)</span></pre>

## Example

To create a blob, use `blob()`, `new_blob()` or `as_blob()`:

<pre class='chroma'>
<span class='kr'><a href='https://rdrr.io/r/base/library.html'>library</a></span><span class='o'>(</span><span class='nv'><a href='https://blob.tidyverse.org'>blob</a></span><span class='o'>)</span>

<span class='nv'>x1</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://rdrr.io/r/base/rawConversion.html'>charToRaw</a></span><span class='o'>(</span><span class='s'>"Good morning"</span><span class='o'>)</span>
<span class='nv'>x2</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://rdrr.io/r/base/raw.html'>as.raw</a></span><span class='o'>(</span><span class='nf'><a href='https://rdrr.io/r/base/c.html'>c</a></span><span class='o'>(</span><span class='m'>0x48</span>, <span class='m'>0x65</span>, <span class='m'>0x6c</span>, <span class='m'>0x6c</span>, <span class='m'>0x6f</span><span class='o'>)</span><span class='o'>)</span>

<span class='nf'><a href='https://blob.tidyverse.org/reference/blob.html'>new_blob</a></span><span class='o'>(</span><span class='nf'><a href='https://rdrr.io/r/base/list.html'>list</a></span><span class='o'>(</span><span class='nv'>x1</span>, <span class='nv'>x2</span><span class='o'>)</span><span class='o'>)</span>
<span class='c'>#&gt; &lt;blob[2]&gt;</span>
<span class='c'>#&gt; [1] blob[12 B] blob[5 B]</span>
<span class='nf'><a href='https://blob.tidyverse.org/reference/blob.html'>blob</a></span><span class='o'>(</span><span class='nv'>x1</span>, <span class='nv'>x2</span><span class='o'>)</span>
<span class='c'>#&gt; &lt;blob[2]&gt;</span>
<span class='c'>#&gt; [1] blob[12 B] blob[5 B]</span>

<span class='nf'><a href='https://blob.tidyverse.org/reference/blob.html'>as_blob</a></span><span class='o'>(</span><span class='nf'><a href='https://rdrr.io/r/base/c.html'>c</a></span><span class='o'>(</span><span class='s'>"Good morning"</span>, <span class='s'>"Good evening"</span><span class='o'>)</span><span class='o'>)</span>
<span class='c'>#&gt; &lt;blob[2]&gt;</span>
<span class='c'>#&gt; [1] blob[12 B] blob[12 B]</span></pre>

------------------------------------------------------------------------

Please note that the ‘blob’ project is released with a [Contributor Code of Conduct](https://github.com/tidyverse/blob/blob/main/CODE_OF_CONDUCT.md). By contributing to this project, you agree to abide by its terms.
