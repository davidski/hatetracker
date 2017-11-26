#' Fetch trends with 30-minute resolution on a specific day.
#'
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#' @importFrom magrittr '%>%'
#' @importFrom tibble as_data_frame
#' @param start_date Beginning of date range.
#' @export
get_hatetracker_activity <- function(start_date = Sys.Date()) {
  httr::GET(paste("https://api.hatetracker.io/v1/activity", start_date, sep = "/")) %>%
    httr::content(as = "text") %>% jsonlite::fromJSON(flatten = TRUE) %>%
    tibble::as_data_frame()
}

#' Fetch trends over a multi-day period with daily resolution.
#'
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#' @importFrom magrittr '%>%'
#' @importFrom tibble as_data_frame
#' @importFrom purrr map
#' @importFrom purrr set_names
#' @importFrom dplyr mutate
#' @param start_date Beginning of date range.
#' @param end_date End of date range.
#' @export
get_hatetracker_activity2 <- function(start_date = Sys.Date(), end_date = NULL) {
  if (is.null(end_date)) end_date <- start_date
  dat <- httr::GET(paste("https://api.hatetracker.io/v1/activity/day", start_date, end_date, sep = "/")) %>%
    httr::content(as = "text") %>% jsonlite::fromJSON(flatten = TRUE) %>%
    tibble::as_data_frame()

  # convert timeline from a nested matrix to nested tibble
  dat$timeline <- purrr::map(dat$timeline, ~ { as_data_frame(.x) %>%
      purrr::set_names(c("date", "z_score")) %>%
      dplyr::mutate(date = as.POSIXct((date / 1000), origin = "1970-01-01"))})

  dat
}

#' Fetch images associated with current trending hate tags.
#'
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#' @importFrom magrittr '%>%'
#' @importFrom tibble as_data_frame
#' @param start_date Beginning of date range. Defaults to the current date.
#' @param end_date End of date range. Defaults to the current date.
#' @param hashtag Optional hashtag to limit search results.
#' @return A dataframe containing the url to the embedded media and the number of times it was referenced in the trending tags.
#' @export
get_hatetracker_images <- function(start_date = Sys.Date(), end_date = Sys.Date(), hashtag = NULL) {

  # construct url
  url <- "https://api.hatetracker.io/v1/images/"
  if (!is.null(hashtag)) url = paste(url, "hashtag", hashtag, sep = "/")
  url <- paste(url, start_date, end_date, sep = "/")

  httr::GET(url) %>%
    httr::content(as = "text") %>% jsonlite::fromJSON(flatten = TRUE) %>%
    tibble::as_data_frame()
}

#' Fetch the top Twitter handles mentioned in certain topic over a given timeframe.
#'
#' Note that the users mentioned in the hashtag are not necessarily part of the
#' alt-right users monitored by the SPLC hatetracker project.
#'
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#' @importFrom magrittr '%>%'
#' @importFrom tibble as_data_frame
#' @param topic Topic hashtag.
#' @param start_date Beginning of date range. Defaults to three weeks from the current date.
#' @param end_date End of date range. Defaults to the current date.
#' @export
get_hatetracker_mentions <- function(topic = NULL, start_date = Sys.Date() - 21, end_date = Sys.Date()) {
  httr::GET(paste("https://api.hatetracker.io/v1/mentions", topic, start_date, end_date, sep = "/")) %>%
    httr::content(as = "text") %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    tibble::as_data_frame()
}
