nycflights14 <- function(path="./", dir="flights", verbose=TRUE) {

    select  =  c(Year="year", Month="month", DayofMonth="day", DepTime ="dep_time", DepDelay="dep_delay", ArrTime="arr_time", ArrDelay="arr_delay", Cancelled="cancelled", Carrier="carrier", TailNum="tailnum", FlightNum="flight", Origin="origin", Dest="dest", AirTime="air_time", Distance="distance")

    ans = flights(year=2014L, month=1:12, path, dir, select=select, verbose=TRUE)
    setcolorder(ans, names(select))
    setnames(ans, unname(select))
    ans = ans[origin %in% c("JFK", "LGA", "EWR")]
    ans[, `:=`(dep_time = as.integer(dep_time), 
               arr_time = as.integer(arr_time), 
               flight=as.integer(flight))]
    ans[, `:=`(hour = dep_time %/% 100L, min = dep_time %% 100L)]
    keycols = c("year", "month", "day")
    setkeyv(ans, keycols)
    ans[]
}
