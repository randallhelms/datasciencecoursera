#p-values

##t-statistic example

2.5 = t

15 = df

H_0 (mu - mu_0) vs H_a (mu > mu_0)

What is probability of t >= 2.5 ?

pt(q = 2.5, df = 15, lower.tail = FALSE)

0.0122529 = if H_0 is true, we would see 1% probability of test statistic with value 2.5

not very likely ...

##example two

2 = t

H_0 = mu_0 = 30
H_a = mu_0 > 30

0.05 = Alpha

qnorm(.95) = 1.644 = reject H_0
qnorm(.99) = 2.326 = accept H_0

pnorm(2) = 0.977

pnorm(q=2,lower.tail = FALSE) = 0.0228

RULE

if p-value is less than the specified alpha you reject the null hypothesis, if it's greater you fail to reject

for two-sided hypothesis, you double smaller of two one-sided p values

#example with two-sided test

Family with 8 children, 7 are girls

H_0 = p = .5
H_a = p != 0.5

pbinom(6,size=8,prob = .5,lower.tail = FALSE)

H_0 = x <= 7

pbinom(7,size=8,prob=.5,lower.tail=TRUE)

#example with Poisson distribution

H_0 = lambda_0 * 100 = 5
H_a = lambda > 0.05

ppois(9,5,lower.tail = FALSE) = 0.0318

REJECT