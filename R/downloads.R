# -----------------
# Exported function
# -----------------
downloadflightlogs <- function(year=2014L, month=1:12, path="./", dir="flights", verbose=TRUE) {

    check_year(year); check_month(month);
    urls = urls_(year, month)
    odir = file.path(path, dir)
    download_logs(urls, odir, verbose)
    unzip_logs(urls, odir, 1L, verbose)
    # fread_logs(urls, odir, verbose)
}

# ------------------
# internal functions
# ------------------
verbose_ <- function(pre, i, tot, file) {
    str = paste("\r", pre, " ", sep="")
    str = paste(str, i, " of ", tot, " - ", sep="")
    str = paste(str, file, " (", sep="")
    str = paste(str, round(i/tot * 100), "%)", sep="")
    cat(str)
    NULL
}

check_year <- function(year) {
    if (length(year) > 1L || !is.numeric(year))
        stop("year must be a non-negative integer of length 1")
}

check_month <- function(month) {
    if (!is.numeric(month) || !all(month %in% 1:12))
        stop("month must be non-negative integers ranging from 1 to 12")    
}

urls_ <- function(year, month) {
    month = unique(month)        
    url_base =  "http://www.transtats.bts.gov/Download/"
    paste(url_base, "On_Time_On_Time_Performance_", year, "_", month, ".zip", sep="")
}

download_logs <- function(urls, path, verbose=TRUE) {
    dir.create(path, showWarnings = FALSE)
    idx = !(match_(urls, path, regex="\\.zip$", pattern="\\.csv$"))
    src  = urls[idx]
    dest = file.path(path, basename(src))
    tot  = length(src)
    ans  = vector("logical", tot)
    for ( i in seq_along(src)) {
        if (verbose) verbose_("Fetching logs", i, tot, basename(src[i]))
        tryCatch({
            download_(src[i], dest[i], quiet=TRUE)
            ans[i] = TRUE
        }, error = function(e) {
            warning(paste("Couldn't open url", src[i], sep=" "))
            system(paste("rm", dest[i]))
        })
    }
    invisible(ans)
}

match_ <- function(urls, path, regex=NULL, pattern=NULL, reverse=FALSE) {
    f1 = basename(urls)
    f2 = list.files(path, pattern=pattern)
    if (!is.null(regex)) {
        f1 = gsub(regex, "", f1)
        f2 = gsub(if (missing(pattern)) regex else pattern, "", f2)
    }
    if (reverse) f2 %chin% f1 else f1 %chin% f2
}

download_ <- function(src, dest, ...) {
    suppressWarnings(
        download.file(url=src, destfile=dest, ...)
    )
}

unzip_logs <- function(urls, path, rec=1L, verbose=TRUE) {
    idx = match_(urls, path, pattern="\\.zip$")
    dest = file.path(path, basename(urls)[idx])
    tot  = length(dest)
    for (i in seq_along(dest)) {
        if (verbose) verbose_("Unzipping logs", i, tot, basename(dest[i]))
        status <- system(paste('unzip -qo', dest[i], "-d", path), ignore.stderr=TRUE)
        if (status) {
            # Unzipping failed. Try downloading one more time
            system(paste("rm", dest[i]))
            yearmon = tail(strsplit(gsub("\\..*$", "", basename(dest[i])), "_", fixed=TRUE)[[1L]], 2L)
            this_url = urls_(yearmon[1L], yearmon[2L])
            ans = download_logs(this_url, path, verbose=FALSE)
            if (ans && rec==1L) unzip_logs(this_url, path, rec+1L)
            else warning(paste("Recursion limit reached, 
               couldn't unzip file", basename(dest[i]), sep=" "))
        }
        # remove successfully unzipped file
        system(paste("rm", dest[i]))
    }
    invisible(NULL)
}


# http://www.transtats.bts.gov/Download_Lookup.asp?Lookup=L_CARRIER_HISTORY
# http://www.transtats.bts.gov/Download_Lookup.asp?Lookup=L_UNIQUE_CARRIERS
