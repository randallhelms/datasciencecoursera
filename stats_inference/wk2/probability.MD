p = probability of head
1-p = probability of tail

p = expected value

p - p^2 = p(1-p) = variance

p' = sampled estimate

(p' - p) / sqrt(p(1-p)/n) = normalized p'

s/sqrt(n) = standard error of sample mean

#distributions

(mu+2*sigma/sqrt(n)) = mean + 2 standard deviations

(mu-2*sigma/sqrt(n)) = mean - 2 standard deviations


p' +/- 2*sqrt(p(1-p)/n) (2 represents the approximate 97.5% normal quantile, or two standard deviations)

n-1 = degrees of freedom

#example

100 = n

.6 = p'

p' +/- 1/sqrt(n) = .6 +/- 1/sqrt(100) = .6 +/- .1

.5 and .7

.6 +/- qnorm(.975)*sqrt(.6(1-.6)/100)