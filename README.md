# flights

`flights` contains functions to download and load flights data from the Bureau of Transportation Statistics. It also contains functions to generate On-time data for flights that departed from NYC (i.e. JFK, LGA or EWR) in 2014. Specifically, `nycflights14`, `nycdelays14` and `nycweatherdelays14`.

# Installation

To install the package, use `devtools`:

```R
devtools::install_github("arunsrinivasan/flights")
```

# Usage

### Download flight logs

```R
downloadflightlogs (year = 2014L, month = 1:12, path = "./", dir = "flights", 
    verbose = TRUE)
```

The function takes a `year` and `month` argument and downloads all the logs available from [here](http://www.transtats.bts.gov/DL_SelectFields.asp?Table_ID=236) and places them in the directory `path/dir`. The downloaded files are automatically replaced with their unzipped versions. If an unzipped log file already exists, then the downloads are skipped. And if the downloaded file was corrupted (which would error while unzipping), then we attempt to download it just once again. If it fails again, we skip this log.

### Load entire `flights` data

```R
flights (year = 2014L, month = 1:12, path = "./", dir = "flights", 
    select = NULL, verbose = TRUE) 

```

This loads all the 100+ columns for the downloaded logs. Note that at the time of writing, logs for 2014 are available until the month of October.

### `nycflights14`

```R
nycflights14 (path = "./", dir = "flights", verbose = TRUE)
```

Loads columns identical to `flights` data from [nycflights13](https://github.com/hadley/nycflights13), except for the year 2014.

### `nycdelays14`

```R
nycflights14 (path = "./", dir = "flights", verbose = TRUE)
```

Loads columns providing additional information about the type of delays for all flights that departed from NYC in 2014.

### `nycweatherdelays14`

```R
nycweatherflights14 (path = "./", dir = "flights", verbose = TRUE)
```

Same as above, but returns only those rows where `weather_delay > 0L`.
