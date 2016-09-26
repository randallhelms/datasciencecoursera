The most common measure of statistical significance

* Their ubiquity makes them controversial among statisticians

**What is a P-value?**

Start with a null hypothesis, and then see how unusual it is to see the estimate obtained

How is unusual is the result?

*Approach*

	1. Define the hypothetical distribution of a data summary when "nothing is going on" (null hypothesis)
	2. Calculate the t-statistic (test statistic) with data we have
	3. Compare the calculate to hypothetical distribution to see if the value is "extreme" (p-value)
	
**Definition**: P-value is probability under the null hypothesis of obtaining evidence (i.e. a t-statistic) as extreme or more extreme than that obtained

If p-value is small than either H0 is true and we have observed a rare event or H0 is false

**Example: attained significance level**

* Test statistic = 2 
* h0 = mu0 = 30
* ha = mu0 > 30

If we reject the one sided test when alpha equals 0.05, would we reject if alpha equals 0.01?

The p-value is the smallest value for alpha at which you would reject the null hypothesis; therefore it is also called the _attained significance level_

**Notes*

P-value gives reader ability to perform the hypothesis test at whatever alpha level they choose

If p-value is less than alpha you reject the null hypothesis

For two-sided hypothesis test, double smaller of the two one sided hypothesis test p-values