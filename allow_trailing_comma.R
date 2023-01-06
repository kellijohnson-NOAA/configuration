#' Modify a function to allow for trailing commas
#'
#' @param .f An unquoted function name.
#' @source \url{r-bloggers.com/2013/03/r-and-the-last-comma}
#' @examples
#' cities <- allow_trailing_comma(c) (
#'   "Atlanta",
#'   "Seattle",
#'   "Tacoma",
#' )
#' new_c <- allow_trailing_comma(base::c)
#' cities_new <- c(
#'   "Atlanta", "Seattle", "Tacoma",
#' )
#' testthat::expect_equal(cities, cities_new)
#'
allow_trailing_comma <- function(.f) {
  function(...) {
    arg.list <- as.list(sys.call())[-1L]
    len <- length(arg.list)
    if (len > 1L) {
      last <- arg.list[[len]]
      if (missing(last)) {
        arg.list <- arg.list[-len]
      }
    }
    do.call(.f, arg.list)
  }
}
