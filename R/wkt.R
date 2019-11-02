#' Convert to WKT
#'
#' Convert to Well-Known-Text geometry string format.
#'
#' Methods exist for the simple features types.
#'
#' Note, this is not the 'WKT' specification for a coordinate reference sytem
#' (map projection), it's a geometry encoding for points, lines, and polygons.
#' @param x object to format as WKT
#' @param ... ignored
#' @export
#' @export
#' @examples
#' wkt(sfobj)
#' wkt(sfobj$geom)
#' wkt(sfobj$geom[[2]])
wkt <- function(x, ...) {
  UseMethod("wkt")
}
#' @name wkt
#' @export
wkt.POINT <- function(x, ...) {
  if (!is.matrix(x)) x<- matrix(x, nrow = 1L)
  declare(wkt_coords(x), "POINT")
}
#' @name wkt
#' @export
wkt.MULTIPOINT <- function(x, ...) {
  declare(wkt_coords(x), "MULTIPOINT")
}
#' @export
#' @name wkt
wkt.LINESTRING <- function(x, ...) {
  declare(wkt_coords(x), "LINESTRING")
}
#' @export
#' @name wkt
wkt.MULTILINESTRING <- function(x, ...) {
  declare(wkt_polygon(x), "MULTILINESTRING")
}
#' @export
#' @name wkt
wkt.POLYGON <- function(x, ...) {
  declare(wkt_polygon(x),
          "POLYGON")
}
#' @export
#' @name wkt
wkt.MULTIPOLYGON <- function(x, ...) {
  declare(paren(paste0(unlist(lapply(unclass(x), wkt_polygon)), collapse = ", ")),
          "MULTIPOLYGON")
}
#' @export
#' @name wkt
wkt.sfc <- function(x, ...) {
  unlist(lapply(unclass(x), wkt))
}
#' @export
#' @name wkt
wkt.sf <- function(x, ...) {
  wkt(x[[attr(x, "sf_column")]])
}
