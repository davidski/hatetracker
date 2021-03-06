% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hatetracker_func.R
\name{get_hatetracker_mentions}
\alias{get_hatetracker_mentions}
\title{Fetch the top Twitter handles mentioned in certain topic over a given timeframe.}
\usage{
get_hatetracker_mentions(hashtag = NULL, start_date = Sys.Date() - 21,
  end_date = Sys.Date())
}
\arguments{
\item{hashtag}{Topic hashtag.}

\item{start_date}{Beginning of date range. Defaults to three weeks from the current date.}

\item{end_date}{End of date range. Defaults to the current date.}
}
\description{
Note that the users mentioned in the hashtag are not necessarily part of the
alt-right users monitored by the SPLC hatetracker project.
}
