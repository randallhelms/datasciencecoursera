dat32 <- data.frame()
for (i in 1:332) {
  dat32 <- rbind(dat32, read.csv(progwk2[i]))
}
str(dat32)