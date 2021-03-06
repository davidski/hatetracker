% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hatetracker_func.R
\name{get_hatetracker_images}
\alias{get_hatetracker_images}
\title{Fetch images associated with current trending hate tags.}
\usage{
get_hatetracker_images(start_date = Sys.Date(), end_date = Sys.Date(),
  hashtag = NULL)
}
\arguments{
\item{start_date}{Beginning of date range. Defaults to the current date.}

\item{end_date}{End of date range. Defaults to the current date.}

\item{hashtag}{Optional hashtag to limit search results.}
}
\value{
A dataframe containing the url to the embedded media and the number of times it was referenced in the trending tags.
}
\description{
Fetch images associated with current trending hate tags.
}
