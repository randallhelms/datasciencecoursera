#collect url for download

fileURL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"

#download the file, default method is ok for windows

download.file(fileURL, destfile = "C:\\Users\\Randall\\rhelms_data\\datasciencecoursera\\getting_data\\wk1\\cameras.csv", method = "curl")
#check it's there

list.files("C:\\Users\\Randall\\rhelms_data\\datasciencecoursera\\getting_data\\wk1")

#add download date

dateDownloaded <- date()

dateDownloaded