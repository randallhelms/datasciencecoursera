library(UsingR); data(father.son) 

t.test(father.son$sheight - father.son$fheight) #want to test if difference of heights is zero, or non-zero

#output 

#	One Sample t-test

# data:  father.son$sheight - father.son$fheight
# t = 11.789, df = 1077, p-value < 2.2e-16
# alternative hypothesis: true mean is not equal to 0
# 95 percent confidence interval:
#  0.8310296 1.1629160
# sample estimates:
#  mean of x 
# 0.9969728 