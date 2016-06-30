#reading from other sources

#find packages by googling something like

"mysql r package"

#interact directly with files

file() #open text file

url() #open url

gzfile() #open .gz gile

bzfile() #open .bz2 file

?connections #get more info

#foreign package
#loads data from Minitab, S, AS, SPSS, Stata, Systat

install.packages("foreign")

library(foreign)

read.arff() #Weka
read.dta() #stata
read.mtp() #minitab
read.octave() #octave
read.spss() #spss
read.xport() #sas

#other database packages

library(RPostgreSQL)

library(RODBC) #connect to PostgreQL, MySQL, Microsoft Access, SQLite

library(RMongo) #connect to MongoDB

#image reading

library(jpeg) #jpg files

library(readbitmap) #bitmaps

library(png) #png files

library(caTools) #gifs

#sound reading

library(tuneR) #mp3

library(seewave) #wav files
