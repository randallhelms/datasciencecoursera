**POWER!!!!!!!**

Power is the probability of rejecting the null hypothesis (H0) when it is false

Power is good, you want MORE power

*Example*

Power tends to come more into play for null results

Important when designing a study

	Want to design study so you have reasonable chance of detecting Ha (alternative hypothesis)
	Type II error is a bad thing - failing to reject H0 when H0 is false
		Probability of Type II error is beta
		Power is 1 - beta
		
Meaningful qualities for hypothesis testing

	Alpha = Type I error rate
	Beta = Type II error rate
	Power = 1 - Beta
	
*Conceptual Example*

Example using RDI

* h0 = mu0 = 30
* ha = mu0 > 30

Power is calculation that mua = value greater than 30

Power is a function that depends on the mean under the null hypothesis

If we plug in values close to 30, it will look like alpha

If we plug in values far from 30m it should get bigger and bigger, up to the point of being nearly 100% if it is far enough away

*Calculating power for Gaussian data

We reject if Xbar > 30 + Z1 - alpha (sigma / sqrt(n))

	Xbar = Sample mean
	Z statistic = z-test with single critical value
	Xbar - mu0 / standard error
	
We're more likely to detect a difference if the difference is very bigger

As sample size increases, then power increases earlier and earlier

As we collect more data, we are more likely to detect a power for a specific value of muA

Power is like a machine with a bunch of knobs - as you turn them, you change the results

**Notes on Power**

Power = 1 - Beta = Probability(Xbar > mu0 + z-statistic - alpha (sigma / sqrt(n)))

Unknowns = muA, sigma, n, beta

Knowns = mu0, alpha

If you can specify an of the three unknowns then you can solve for the remainder

For Ha you can calculate one-sided power using alpha / 2 (for whatever direction mua is)

**Basic rules on Power**

	As Alpha gets larger, power gets larger
	Power of one-sided test is greater than power of two-sided test
	Power goes up as mu1 gets further away from mu0
	Power goes up as n goes up
	As sigma goes down, less variability, therefore higher power
	Power depends on function of certain elements; you really need to know this:
		(sqrt(n) * (mua - mu0)) / sigma (standard error)
	Effect size = (mua - mu0) / sigma
	Unit free means interprability across problems


