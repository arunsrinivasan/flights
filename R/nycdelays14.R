weather_delay <- origin <- arr_time <- dep_time <- flight <- NULL
    
nycdelays14 <- function(path="./", dir="flights", verbose=TRUE) {

    select  =  c(Year="year", Month="month", DayofMonth="day", DepTime ="dep_time", ArrTime="arr_time", Carrier="carrier", TailNum="tailnum", FlightNum="flight", Origin="origin", Dest="dest", CarrierDelay="carrier_delay", WeatherDelay="weather_delay", NASDelay="nas_delay", LateAircraftDelay="aircraft_delay")

    ans = flights(year=2014L, month=1:12, path, dir, select=select, verbose=TRUE)
    setcolorder(ans, names(select))
    setnames(ans, unname(select))
    ans = ans[origin %in% c("JFK", "LGA", "EWR")]
    ans[, `:=`(dep_time = as.integer(dep_time), 
               arr_time = as.integer(arr_time), 
               flight=as.integer(flight))]
    keycols = c("year", "month", "day")
    setkeyv(ans, keycols)
    ans[]
}

nycweatherdelays14 <- function(path="./", dir="flights", verbose=TRUE) {
    delays = nycdelays14(path, dir, verbose)
    delays[weather_delay > 0L]
}
