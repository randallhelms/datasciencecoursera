**Hypothesis Testing**

* Hypothesis testing is concerned with making decisions using data
* A null hypothesis is specified that represents the status quo, usually labeled $H_0$
* The null hypothesis is assumed true and statistical evidence is required to reject it in favor of a research or alternative hypothesis

H0 = Null hypothesis represents status quo
Ha = Alternative hypothesis

**Example**

	Respiratory disturbance index (RDI) of more than 30 events hour is evidence of severe sleep disordered breathing (SDB)
	Study of 100 overweight subjects saw mean RDI of 32 events / hour with standard deviation of 10
	
Testing:

H0 : RDI  = 30
Ha : RDI > 30

Four outcomes:

Truth H0 decide H0
Truth H0 decide Ha = Type I error
Truth Ha decide Ha
Truth Ha decide H0 = Type II error

Type I and Type II errors are related and inverse

Strategy: reject H0 is RDI is larger than some constant (C)

Typically: C is chosen to make p(Type I) 0.05

10 / sqrt(st.dev of population) = standard error of the mean

10 / sqrt(100) = 10

Choose C so that P(RDI > C; H0) = 0.05

C = 30 + 1 * 1.645 = 31.645

Can also reject due to Z score (how many standard errors the sample mean is above the hypothesis mean)

(32 - 30) / (10 / sqrt(100)) = 2

Sample mean = 32
Hypothesized mean = 30
Standard error = 10
Number = 100

2 > 1.645 = reject H0 (the null hypothesis)

**Choosing a rejection region**

Suppose that n=16 (rather than 100)

(32 - 30) / (10 / sqrt(16)) = 0.8 

qt(.95,15) = 1.7531; 95th percentile of T-distribution with 15 df

0.8 < 1.645 = failing to reject H0

*Two-sided tests*

Suppose we reject null hypothesis is mean was too large or too small

Want to test if: Ha = mu != 30 

Will reject if test statistic (0.8) is too large or too small

qt(.975, 15); qt(.025,15) #split the 5% error rate into two halves

2.13145 > 0.8 > -2.13145 = fail to reject

*Exact binomial test*

If a friend has 8 children, 7 girls, no twins, what's probability of 9 girls?

*NOTES*

    It's impossible to get an exact 5% level test for this case due to the discreteness of the binomial.
        The closest is the rejection region [7 : 8]
        Any alpha level lower than r 1 / 2 ^8 is not attainable.
    For larger sample sizes, we could do a normal approximation, but you already knew this.
    Two sided test isn't obvious.
        Given a way to do two sided tests, we could take the set of values of $p_0$ for which we fail to reject to get an exact binomial confidence interval (called the Clopper/Pearson interval, BTW)
    For these problems, people always create a P-value (next lecture) rather than computing the rejection region.