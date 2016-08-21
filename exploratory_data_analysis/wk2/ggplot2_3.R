#ggplot2 ... part 3!

testdat <- data.frame(x = 1:100, y = rnorm(100))

testdat[50,2] <- 100 #outlier

plot(testdat$x, testdat$y, type = "l", ylim = c(-3,3))

g1 <- ggplot(testdat, aes(x=x,y=y))

g1 + geom_line()

#change the axis limits

g1 + geom_line() + ylim(-3,3) #outlier missing

g1 + geom_line() + coord_cartesian(ylim = c(-3,3)) #outlier included

#go back to maacs data set

#need to make no2 categorical

maacs$logno2_new <- log(maacs$eno)

cutpoints <- quantile(maacs$logno2_new, seq(0,1, length = 4), na.rm = TRUE)
 
maacs$no2dec <- cut(maacs$logno2_new,cutpoints)

levels(maacs$no2dec) #see the three categories

#make one final big plot

#start with a data frame

h <- ggplot(maacs,aes(logpm25,logeno))

#add layers

h + geom_point(alpha = 1/3) + geom_smooth(method = "lm", se = FALSE, col = "green") + theme_bw(base_family = "Avenir", base_size = 10) + labs(x = "Log PM25", y = "Log ENO") + labs(title = "MAACS Cohort")