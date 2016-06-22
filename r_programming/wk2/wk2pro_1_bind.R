wk32pro <- data.frame()
for (i in 1:332) {
  wk32pro <- rbind(wk32pro, read.csv(progwk2[i]))
}
str(wk32pro)