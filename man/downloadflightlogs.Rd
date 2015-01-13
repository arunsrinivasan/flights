\name{downloadflightlogs}
\alias{downloadflightlogs}
\title{Download flight logs from the Bureau of Transportation Statistics}
\description{
  Download flight logs for a given year, and months, to the folder specified.
}
\usage{
downloadflightlogs (year = 2014L, month = 1:12, path = "./", dir = "flights", 
    verbose = TRUE)
}
\arguments{
  \item{year}{ Year for which the logs should be downloaded. Numeric vector of length=1. }
  \item{month}{ Months for which logs should be downloaded for the given year. }
  \item{path}{ Path excluding the directory to download logs to. }
  \item{dir}{ Directory within \code{path} where the logs will be downloaded to. }
  \item{verbose}{ \code{TRUE} provide messages to the console. }
}
\details{
    \code{downloadflightlogs} creates a folder under the path \code{path/dir} and downloads flight logs for the year \code{year} and months specified in \code{month}. After downloading all the logs, they will be automatically replaced with corresponding unzipped versions. If an unzipped log already exists, then download of that log will be skipped. If a log that was downloaded was corrupted, it'll be deleted automatically and will be attemped again for download+unzip. If it fails again, the download of that log will be skipped (with a warning).
    
    As long as unzipped logs exist in the directory, they won't be downloaded again. So, it is preferred to keep using the same directory without deleting the logs that've been already downloaded, to save time.
}
\references{
\url{https://github.com/hadley/nycflights13}
\url{http://www.transtats.bts.gov/DL_SelectFields.asp?Table_ID=236}
}
\examples{
\dontrun{
dt = downloadflightlogs(month=1:2, year=2014, path="~/Downloads")
}
}
\seealso{
  \code{\link{flights}}, \code{\link{nycflights14}}, \code{\link{nycdelays14}}, \code{\link{nycweatherdelays14}}
}
\keyword{ data }
