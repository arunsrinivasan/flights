\name{nycdelays14}
\alias{nycdelays}
\alias{nycdelays14}
\alias{nycweatherdelays14}
\title{ NYC flight delays for the year 2014}
\description{
    On-time data for flights that departed NYC (i.e. JFK, LGA or EWR) in 2014.

    \code{nycdelays14} function loads all the delays for 2014.

    \code{nycweatherdelays14} function loads just the weather delays for 2014.
}
\usage{
nycdelays14 (path = "./", dir = "flights", verbose = TRUE)
# only weather delays
nycweatherdelays14 (path = "./", dir = "flights", verbose = TRUE)
}
\arguments{
  \item{path}{ Path excluding the directory to download logs to. }
  \item{dir}{ Directory within \code{path} where the logs will be downloaded to. }
  \item{verbose}{ \code{TRUE} provide messages to the console. }
}
\format{
   Delays data contains 14 columns
   \describe{
     \item{year,month,day}{ Departure date. }
     \item{dep_time, arr_time}{ Departure and arrival times at local tz. }
     \item{carrier}{ Two letter carrier code. }
     \item{tailnum}{ Tail number. }
     \item{flight}{ Flight number. }
     \item{origin}{ Origin airport. }
     \item{dest}{ Desitination airport. }
     \item{carrier_delay}{Carrier delay, in minutes. }
     \item{weather_delay}{Weather delay, in minutes. }
     \item{nas_delay}{ National air system delay, in minutes. }
     \item{aircraft_delay}{Late aircraft delay, in minutes.}
  }
}
\value{
    A \code{data.table}
}
\references{
  \url{http://www.transtats.bts.gov/DL_SelectFields.asp?Table_ID=236}
}
\examples{
\dontrun{
  dt = nycdelays14(path="~/Downloads")
}
}
\seealso{
  \code{\link{downloadflightlogs}}, \code{\link{flights}}, \code{\link{nycflights14}}
}
\keyword{ data }
