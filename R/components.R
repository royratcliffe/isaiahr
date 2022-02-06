#' STL decomposition components
#' @inheritDotParams stl
#' @return Decomposition table (\code{\link[fabletools]{dable}}) comprising
#'   trend, season and remainder.
#' @export
#' @examplesIf requireNamespace("tsibble", quietly = TRUE)
#' tsibble::as_tsibble(USAccDeaths) %>%
#'   isaiahr::stl_components("value") %>%
#'   fabletools::autoplot()
stl_components <- function(...) {
  stl(...) %>% fabletools::components()
}
