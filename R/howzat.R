#' Convert matrix to tuple set
#'
#' Matrix of numbers formatted to space-separated rows
#' @param number matrix
#' @noRd
matrix_tuple <- function(x) {
  paste(unlist(lapply(split(t(x), rep(seq_len(dim(x)[1L]), each = dim(x)[2L])), paste0, collapse = " ")),
        collapse = ", ")
}
#' Format with parentheses
#'
#' Wrap the input in parentheses
#' @noRd
#' @param character string
paren <- function(x) {
  sprintf("(%s)", x)
}

#' declare what's coming around a text string
#'
#' Prepend the declaration to the input string
#' @noRd
#' @param x character string
#' @param DECLARATION the preamble speech
declare <- function(x, DECLARATION) {
  sprintf("%s %s", DECLARATION, x)
}

#' Format matrix to parenthesized character string
#'
#' @param x matrix
#'
#' @return character string
#' @noRd
wkt_coords <- function(x) {
  paren(matrix_tuple(x))
}
#' Format list of matrix to parenthesized character strings
#'
#' @param x list of matrixes
#'
#' @return vector of character strings
#' @noRd
wkt_polygon <- function(x) {
  paren(paste(unlist(lapply(unclass(x), function(m) wkt_coords(m))), collapse = ", "))
}
