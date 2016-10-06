# Script to automatically download and unzip data

temp <- tempfile()
download.file("http://downloads.cms.gov/files/hcris/HOSP10FY2011.zip", temp)
unzip(temp)
p1 <- unz("HOSP2011.zip", "./hosp10_2011_ALPHA.CSV")
p1 <- gzfile("HOSP2011.zip")
p1