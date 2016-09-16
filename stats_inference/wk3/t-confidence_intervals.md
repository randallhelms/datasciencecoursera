**T confidence interval**

Aka the Student's T-Distribution

	Thicker tails than normal
	Indexed by degrees of freedom
		As df increases, it is more like a standard normal
	
f(t) = (gamma * ((df + 1) / 2) / sqrt(df * pi * gamma (df / 2)) * (1 + (t^2 / v)))^ - df + 1 / 2

As n increases, the difference is irrelevant

Standard normal can give too narrow confidence intervals

T-Distribution can be much larger than normal quantiles at low numbers of degrees of freedom

Intervals can be heavily affected by choice of distribution

*Notes on the t-interval**

	Assumes that data are iid normal
	Works well whenever the distribution of the data is roughly symmetric and mound shaped
	Paired observations are often analyzed using the t interval by taking differences
	For large degrees of freedom: t quantiles become same as standard normal quantiles
	Doesn't work well for skewed distributions
		Use logs or different summary like mean
		
**Independent group t confidence intervals**

Example: want to compare mean blood pressure between two randomized groups

Can't use paired t test because groups are independent

Standard confidence interval is:

Average(Ygroup) - Average(Xgroup) +/- nx + ny - 2 * Sp * ( (1/nx) - (1/ny) )

Estimate of the variance should be an average of variance estimate from Ygroup and Xgroup

Pooled variance way of weighting variance for two groups with separate sample sizes

Confidence interval assumes constant variance across groups

**Note on unequal variance**

Formula:

	Difference in the means plus or minus a t quantile times the standard error
	
	Or
	
	Y(mean) - X(mean) +/- t(df) * (sx^2 / nx + sy^2 / ny) ^ 1/2
	
When in doubt use the unequal variance interval

In R, use t.test(...,var.equal=FALSE)

**Final notes**

For binomial data, you can compare two groups

	Relative risk, risk difference, odds ratio
	Chi-squared tests, normal approximations, exact tests
	
For count data, you can also use Chi-squared tests and exact tests