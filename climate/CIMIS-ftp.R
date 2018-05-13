library(curl)
# https://stackoverflow.com/questions/36645445/downloading-files-from-ftp-with-r 
url <- "ftp://ftpcimis.water.ca.gov/pub2/daily/"
h <- new_handle(dirlistonly=TRUE)
con <- curl(url, "r", h)
tbl <- read.table(con, stringsAsFactors=TRUE, fill=TRUE)
close(con)
head(tbl)

url <- "ftp://ftpcimis.water.ca.gov/pub2/daily/daily231.csv"
dir <- "/Users/rcphelps/code/thesis/climate/CIMIS/"
urls <- paste0(url, tbl[1:5,1])
fls = basename(urls)
curl_fetch_disk(url, "/Users/rcphelps/code/thesis/climate/CIMIS/daily231.csv"")
