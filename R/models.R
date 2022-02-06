#' STL decomposition
#'
#' Changes the default \code{robust} from \code{FALSE} to \code{TRUE}; estimates
#' a robust STL by default.
#'
#' @param .data Data frame to decompose.
#' @param colname Column name of time-dependent response variable.
#' @param window Span of the Loess window.
#' @inheritDotParams stats::stl
#' @return Model data frame, a \code{\link[fabletools]{mable}}, with `stl` model
#'   column.
#' @export
#' @examplesIf requireNamespace("tsibble", quietly = TRUE)
#' tsibble::as_tsibble(USAccDeaths) %>%
#'   isaiahr::stl("value") %>%
#'   fabletools::components() %>%
#'   fabletools::autoplot()
stl <- function(.data, colname, window = NULL, ...) {
  dots <- list(...)
  if (is.null(dots$robust)) dots$robust <- TRUE
  fabletools::model(.data, stl = feasts::STL(
    !!rlang::sym(colname) ~ trend(window = window) +
      season(window = "periodic"),
    unlist(dots)
  ))
}
