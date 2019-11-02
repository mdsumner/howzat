
<!-- README.md is generated from README.Rmd. Please edit that file -->

# howzat

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/mdsumner/howzat.svg?branch=master)](https://travis-ci.org/mdsumner/howzat)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/mdsumner/howzat?branch=master&svg=true)](https://ci.appveyor.com/project/mdsumner/howzat)
[![Codecov test
coverage](https://codecov.io/gh/mdsumner/howzat/branch/master/graph/badge.svg)](https://codecov.io/gh/mdsumner/howzat?branch=master)
<!-- badges: end -->

The goal of howzat is to convert spatial objects to [WKT
(Well-Known-Text) geometry
format](https://en.wikipedia.org/wiki/Well-known_text_representation_of_geometry).

WIP: supremely unuseable and untested for now.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("mdsumner/howzat")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(howzat)


library(silicate)  ## just for data examples
#> 
#> Attaching package: 'silicate'
#> The following object is masked from 'package:stats':
#> 
#>     filter
library(sf)        ## just to verify the formatting
#> Linking to GEOS 3.7.1, GDAL 2.4.2, PROJ 5.2.0

wkt(sfzoo$polygon)
#> [1] "POLYGON ((0 0, 1 0, 3 2, 2 4, 1 4, 0 0), (1 1, 1 2, 2 2, 1 1))"
wkt(sfzoo$polygon) == st_as_text(sfzoo$polygon)
#> [1] TRUE
wkt(st_sfc(sfzoo$multipolygon, sfzoo$multipolygon + 10))
#> [1] "MULTIPOLYGON (((0 0, 1 0, 3 2, 2 4, 1 4, 0 0), (1 1, 1 2, 2 2, 1 1)), ((3 0, 4 0, 4 1, 3 1, 3 0), (3.3 0.3, 3.3 0.8, 3.8 0.8, 3.8 0.3, 3.3 0.3)), ((3 3, 4 2, 4 3, 3 3)))"                                                
#> [2] "MULTIPOLYGON (((10 10, 11 10, 13 12, 12 14, 11 14, 10 10), (11 11, 11 12, 12 12, 11 11)), ((13 10, 14 10, 14 11, 13 11, 13 10), (13.3 10.3, 13.3 10.8, 13.8 10.8, 13.8 10.3, 13.3 10.3)), ((13 13, 14 12, 14 13, 13 13)))"
wkt(st_sf(a = 1, g = st_sfc(sfzoo$multipolygon)))
#> [1] "MULTIPOLYGON (((0 0, 1 0, 3 2, 2 4, 1 4, 0 0), (1 1, 1 2, 2 2, 1 1)), ((3 0, 4 0, 4 1, 3 1, 3 0), (3.3 0.3, 3.3 0.8, 3.8 0.8, 3.8 0.3, 3.3 0.3)), ((3 3, 4 2, 4 3, 3 3)))"
wkt(sfzoo$multilinestring)
#> [1] "MULTILINESTRING ((0 3, 0 4, 1 5, 2 5), (0.2 3, 0.2 4, 1 4.8, 2 4.8), (0 4.4, 0.6 5))"
wkt(sfzoo$multilinestring) == st_as_text(sfzoo$multilinestring)
#> [1] TRUE
wkt(sfzoo$linestring)
#> [1] "LINESTRING (0 3, 0 4, 1 5, 2 5)"
wkt(sfzoo$linestring) == st_as_text(sfzoo$linestring)
#> [1] TRUE
wkt(sfzoo$multipoint)
#> [1] "MULTIPOINT (3.2 4, 3 4.6, 3.8 4.4, 3.5 3.8, 3.4 3.6, 3.9 4.5)"
wkt(sfzoo$multipoint) == st_as_text(sfzoo$multipoint)
#> [1] TRUE
wkt(sfzoo$point)
#> [1] "POINT (1 2)"
wkt(sfzoo$point) == st_as_text(sfzoo$point)
#> [1] TRUE


wkt(sfzoo$multipolygon)
#> [1] "MULTIPOLYGON (((0 0, 1 0, 3 2, 2 4, 1 4, 0 0), (1 1, 1 2, 2 2, 1 1)), ((3 0, 4 0, 4 1, 3 1, 3 0), (3.3 0.3, 3.3 0.8, 3.8 0.8, 3.8 0.3, 3.3 0.3)), ((3 3, 4 2, 4 3, 3 3)))"
wkt(sfzoo$multipolygon) == st_as_text(sfzoo$multipolygon)
#> [1] TRUE
```

-----

Please note that the ‘howzat’ project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.
