\name{nycflights14}
\alias{nycflights14}
\alias{nycflights}
\title{ NYC flights data for the year 2014}
\description{
    On-time data for flights that departed NYC (i.e. JFK, LGA or EWR) in 2014.

    \code{nycdelays14} function loads all the delays for 2014.
}
\usage{
nycflights14 (path = "./", dir = "flights", verbose = TRUE)
}
\arguments{
  \item{path}{ Path excluding the directory to download logs to. }
  \item{dir}{ Directory within \code{path} where the logs will be downloaded to. }
  \item{verbose}{ \code{TRUE} provide messages to the console. }
}
\details{
  The format is identical to \code{flights} data from \code{nycflights13}, except for the year 2014. At the time of writing, this data set contains stats only until October 2014. You can find the description of all the columns in the url mentioned in references section. 
}
\value{
    A \code{data.table}
}
\references{
\url{https://github.com/hadley/nycflights13}
\url{http://www.rdocumentation.org/packages/nycflights13/functions/flights}
}

\examples{
\dontrun{
dt = nycflights14(path="~/Downloads")
}
}
\seealso{
  \code{\link{downloadflightlogs}}, \code{\link{flights}}, \code{\link{nycdelays14}}, \code{\link{nycweatherdelays14}}
}
\keyword{ data }
