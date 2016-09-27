**Reasons for multiple testing**

	Volume of data means that opportunity for error increases
	Errors can come from mistakes in interpretation, or from experiment design
	If we allow for 5% chance of error, with 20 tests at least 1 error likely

**Types of Errors**

Suppose testing hypothesis that parameter equals zero VS alternative that it does not equal zero

Claim B = 0
Claim B != 0

Type I error is a false positive
Type II error is a false negative

Most scientific investigations focus more on Type I errors

Types of Error Rates:

	The false positive rate. Rate at which false results are called significant (V/h0)
	Family wise error rate: Probability of at least one false positive
	False discovery rate: Rate at which claims of significance are false (V/R)
	
False positive rate is closely related to Type I error rate

**Controlling the false positive rate**

If p-values are correctly calculated calling P < alpha will control the false positive rate at level alpha on average

Problem: Suppose you perform 10,000 tests and Beta = 0 for all of them

Call P < 0.05 significant

Expected number of false positives is 500

How to avoid that?

**Controlling the family-wise error rate**

Bonferroni correction:

	Suppose you go m tests
	Control FWER at level alpha so Pr(V>=1) <alpha
	Calculate P-values normally
	Set alpha fwer = alpha / m
	Call all P-values less than alpha fwer significant
	
Easy to calculate, but might be conservative

**Controlling false discovery rate (FDR)**

Most popular correction when doing lots of tests

	Suppose you go m tests
	Control FDR at level alpha so E[V/R]
	Calculate P-values normally
	Order the P-Values from smallest to largest
	Call any P(i) <= alpha & i/m significant
	
Still easy to calculate and less conservative (but allows for more false positives)

**Adjusted p-values**

	Approach the threshold alpha
	Not p-values any more
	Can be used without directly adjusting alpha
	Suppose p-values are P1 ... Pm
	Adjust by taking Pfwer = maxm X Pi, 1 for each p-value 
	Then if you call all Pfwer < alpha you will control the FWER
	


