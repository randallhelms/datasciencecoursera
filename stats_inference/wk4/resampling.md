**Resampling**

The bootstrap is a important tool for constructing confidence intervals and calculating standard errors for difficult statistics

Bootstrap liberates analysts from doing lots of calculations

Example: how do you derive a confidence interval for the median?

Sample of 50 die rolls: What's the distribution?

	Do it mathematically
	Roll a die 50 times, then repeat process over and over again
	
The boorstrap principle

    Suppose that I have a statistic that estimates some population parameter, but I don't know its sampling distribution
    The bootstrap principle suggests using the distribution defined by the data to approximate its sampling distribution

The bootstrap in practice

    In practice, the bootstrap principle is always carried out using simulation
    We will cover only a few aspects of bootstrap resampling

    The general procedure follows by first simulating complete data sets from the observed data with replacement
        This is approximately drawing from the sampling distribution of that statistic, at least as far as the data is able to approximate the true population distribution

    Calculate the statistic for each simulated data set
    Use the simulated statistics to either define a confidence interval or take the standard deviation to calculate a standard error
	
Nonparametric bootstrap algorithm example

    Bootstrap procedure for calculating confidence interval for the median from a data set of $n$ observations

    i. Sample $n$ observations with replacement from the observed data resulting in one simulated complete data set

    ii. Take the median of the simulated data set

    iii. Repeat these two steps $B$ times, resulting in $B$ simulated medians

    iv. These medians are approximately drawn from the sampling distribution of the median of $n$ observations; therefore we can
        Draw a histogram of them
        Calculate their standard deviation to estimate the standard error of the median
        Take the $2.5^{th}$ and $97.5^{th}$ percentiles as a confidence interval for the median


