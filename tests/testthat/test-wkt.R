mp2 <- c("MULTIPOLYGON (((0 0, 1 0, 3 2, 2 4, 1 4, 0 0), (1 1, 1 2, 2 2, 1 1)), ((3 0, 4 0, 4 1, 3 1, 3 0), (3.3 0.3, 3.3 0.8, 3.8 0.8, 3.8 0.3, 3.3 0.3)), ((3 3, 4 2, 4 3, 3 3)))",
  "MULTIPOLYGON (((5 5, 5.3 5, 5.9 5.6, 5.6 6.2, 5.3 6.2, 5 5), (5.3 5.3, 5.3 5.6, 5.6 5.6, 5.3 5.3)), ((5.9 5, 6.2 5, 6.2 5.3, 5.9 5.3, 5.9 5), (5.99 5.09, 5.99 5.24, 6.14 5.24, 6.14 5.09, 5.99 5.09)), ((5.9 5.9, 6.2 5.6, 6.2 5.9, 5.9 5.9)))"
)
p1 <- "POLYGON ((0 0, 1 0, 3 2, 2 4, 1 4, 0 0), (1 1, 1 2, 2 2, 1 1))"


test_that("wkt to multipolygon works", {
  expect_equal(wkt(sfobj$geom), mp2)
})
#wkt(sfzoo$multilinestring)
#> [1] "MULTILINESTRING ((0 3, 0 4, 1 5, 2 5), (0.2 3, 0.2 4, 1 4.8, 2 4.8), (0 4.4, 0.6 5))"
#wkt(sfzoo$multilinestring) == st_as_text(sfzoo$multilinestring)
#> [1] TRUE
#wkt(sfzoo$linestring)
#> [1] "LINESTRING (0 3, 0 4, 1 5, 2 5)"
#wkt(sfzoo$linestring) == st_as_text(sfzoo$linestring)
#> [1] TRUE
#wkt(sfzoo$multipoint)
#> [1] "MULTIPOINT (3.2 4, 3 4.6, 3.8 4.4, 3.5 3.8, 3.4 3.6, 3.9 4.5)"
#wkt(sfzoo$multipoint) == st_as_text(sfzoo$multipoint)
#> [1] TRUE
#wkt(sfzoo$point)
#> [1] "POINT (1 2)"
#wkt(sfzoo$point) == st_as_text(sfzoo$point)
#> [1] TRUE

