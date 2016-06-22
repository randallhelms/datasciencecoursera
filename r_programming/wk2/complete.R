complete <- function(directory, id = 1:332) {
  nobs <- function (id) {
  #set the path
  wd = directory
  
  #get the file List in that directory
  fileList = list.files(wd)
  
  #extract the file names and store as numeric for comparison
  file.names = as.numeric(sub("\\.csv$","",fileList))

  #select files to be imported based on the user input or default
  selected.files = fileList[match(id,file.names)]
  
  #import data
  Data = lapply(file.path(wd,selected.files),read.csv)
  
  #convert into data frame
  Data = do.call(rbind.data.frame,Data)
  
  #calculate sum
  sum(complete.cases(Data))}
  
  #pass the values out
  return (data.frame(id=id, nobs=sapply(id,nobs)))
}