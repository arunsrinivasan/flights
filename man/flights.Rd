\name{flights}
\alias{flights}
\title{Load flights data}
\description{
    Function to load flights data from downloaded flight logs
}
\usage{
flights (year = 2014L, month = 1:12, path = "./", dir = "flights", 
    select = NULL, verbose = TRUE) 
}
\arguments{
  \item{year}{ Year for which the logs should be downloaded. Numeric vector of length=1. }
  \item{month}{ Months for which logs should be downloaded for the given year. }
  \item{path}{ Path excluding the directory to download logs to. }
  \item{dir}{ Directory within \code{path} where the logs will be downloaded to. }
  \item{select}{ Columns to read in. Default will read all 100+ columns. }
  \item{verbose}{ \code{TRUE} provide messages to the console. }
}
\details{
    It loads the entire data; \emph{all the 100+ columns} corresponding to all airports for the specified duration. 
}
\value{
    A \code{data.table}. 
}
\references{
\url{https://github.com/hadley/nycflights13}
}
\examples{
\dontrun{
dt = flights(year=2014, month=1:2, path="~/Downloads")
}
}
\seealso{
  \code{\link{downloadflightlogs}}, \code{\link{nycflights14}}, \code{\link{nycdelays14}}, \code{\link{nycweatherdelays14}}
}
\keyword{ data }
