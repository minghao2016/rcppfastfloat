% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{as.double2}
\alias{as.double2}
\title{Ultra efficient string-to-\code{double} Conversion}
\usage{
as.double2(x)
}
\arguments{
\item{x}{A vector of type \code{character}.}
}
\description{
For \code{character} \code{vector}s,\code{as.double2()} is a drop-in replacement for \code{base::as.double()}.
}
\examples{
set.seed(8675309)
input <- sample(c(
  paste0(" \r\n\t\f\\v", c(0.0, sqrt(seq(1, 10))), " \r\n\t\f\\v"),
  c("NaN", "-NaN", "nan", "-nan",
    "Inf", "-Inf", "inf", "-inf", "infinity", "-infinity",
    NA_character_,
    "  1970-01-01", "1970-01-02  ")
))
input

suppressWarnings(as.double2(input)) # NAs introduced by coercion

comparison <- suppressWarnings(
  matrix(c(as.double(input), as.double2(input)),
         ncol = 2L,
         dimnames = list(NULL, c("as.double()", "as.double2()")))
)
comparison

all.equal(comparison[, "as.double()"], comparison[, "as.double2()"])

}
\seealso{
\code{\link[base:double]{base::as.double()}}
}
