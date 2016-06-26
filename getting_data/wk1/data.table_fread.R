#example of fast reading

big_df <- data.frame(x=rnorm(1E6),y=rnorm(1E6))

file <- tempfile()

write.table(big_df,file = file,row.names = FALSE,col.names = TRUE,sep="\t",quote = FALSE)

#use fread function for quick reading

system.time(fread(file))

#compare to other method for reading in

system.time(read.table(file,header=TRUE,sep="\t"))