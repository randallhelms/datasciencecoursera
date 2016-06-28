#install and load the HDF5 package

source("http://bioconductor.org/biocLite.R")

biocLite("rhdf5")

library(rhdf5)

created=h5createFile("example.h5")

created

#create groups

created = h5createGroup("example.h5","foo")
created = h5createGroup("example.h5","baa")
created = h5createGroup("example.h5","foo/foobaa")

h5ls("example.h5")

#write to groups

h5ex = "example.h5"

A = matrix(1:10,nr=5,nc=2)

h5write(A, h5ex,"foo/A")

B = array(seq(0.1,2.0,by=0.1),dim=c(5,2,2))

attr(B,"scale") <- "liter"

h5write(B,h5ex,"foo/foobaa/B")

h5ls(h5ex)

#write a data set directly

df = data.frame(1L:5L,seq(0,1,length.out = 5),
                c("ab","cde","fghi","a","s"),stringsAsFactors = FALSE)

h5write(df,h5ex,"df")

h5ls(h5ex)

#read data

fooA = "foo/A"
foobaaB = "foo/foobaa/B"

readA =h5read(h5ex,fooA)
readB = h5read(h5ex,foobaaB)
readdf = h5read(h5ex,"df")

#writing and reading chunks
#in this example:
#write <c> values to the <list> rows and columns

h5write(c(12,13,14),h5ex,fooA,index=list(1:3,1))

h5read(h5ex,fooA)


