t=(X'-mu)/(s/sqrt(n)) = t-statistic

	X' and mu are means
	X' is average difference
	n is integer like sample size
	s is standard deviation

Est +/- t-quantile *std error(Est) = confidence interval for t-distribution

(X' - mu)/(s/sqrt(n)) has n-1 degrees of freedom

as df (degrees of freedom) increases the t distribution gets more like a normal distribution

if you replace s (standard deviation) with sigma you get the standard normal

degrees of freedom = number of values in a final calculation that are free to vary

X' +/- t_(n-1)*s/sqrt(n) = t-interval

t_(n-1) is relevant quantile

*EXAMPLE*

mn + c(-1,1) * qt(.975,9) * s/sqrt(10)

	mn = average difference
	qt(.975,9) is .975 interval, 9 degrees of freedom (n-1)
	10 is n
  
This says that with probability .95 the average difference of effects (between the two drugs) for an individual patient is between .7 and 2.46 additional hours of sleep.



