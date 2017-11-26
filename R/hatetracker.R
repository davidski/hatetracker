#' hatetracker: A package for working with the SPLC hatetracker.io API.
#'
#' The foo package provides three categories of important functions:
#' foo, bar and baz.
#'
#' @section hatetracker functions:
#' The foo functions ...
#'
#' @docType package
#' @name hatetracker
NULL

.onAttach <- function(...) {
  packageStartupMessage("Hatetracker.IO is a service from the Southern Poverty Law Center.")
  packageStartupMessage("Please consider donating at https://donate.splcenter.org/sslpage.aspx?pid=463")
}
