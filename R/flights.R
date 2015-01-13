flights <- function(year=2014, month=1:12, path="./", dir="flights", select=NULL, verbose=TRUE) {
    check_year(year); check_month(month);
    path = file.path(path, dir)
    files = paste(path, "/On_Time_On_Time_Performance_", year, "_", month, ".csv", sep="")
    idx  = match_(files, path, regex="\\.csv$", pattern="\\.csv$", reverse=FALSE)
    if (!all(idx)) {
        message("Some files specified in input is not available. Trying to fetch those files.")
        downloadflightlogs(year, month[!idx], path, dir, verbose)
    }
    dest = charsort(file.path(path, list.files(path, pattern="\\.csv$")[idx]))
    tot  = length(dest)
    ans  = lapply(seq_along(dest), function(i){
        if (verbose) verbose_("Fread(ing) logs   ", i, tot, basename(dest[i]))
        fread(dest[i], select=names(select))
    })
    ans = rbindlist(ans, use.names=TRUE)
    ans[]
}

charsort = function(x) {
    y = gsub(".*_|\\..*$", "", basename(x))
    x[order(as.integer(y))]
}
