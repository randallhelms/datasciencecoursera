#sample of 50 die rolls

library(ggplot2)
library(gridExtra)

nosim <- 1000

cfunc <- function(x, n) mean(x)
g1 = ggplot(data.frame(y = rep(1/6, 6), x = 1 : 6), aes(y = y, x = x))
g1 = g1 + geom_bar(stat = "identity", fill = "lightblue", colour = "black")

dat <- data.frame(x = apply(matrix(sample(1 : 6, nosim * 50, replace = TRUE), 
                                   nosim), 1, mean))
g2 <- ggplot(dat, aes(x = x)) + geom_histogram(binwidth=.2, colour = "black", fill = "salmon", aes(y = ..density..)) 

grid.arrange(g1, g2, ncol = 2)

#what if we only had one sample?

n = 50
B = 1000
## our data
x = sample(1 : 6, n, replace = TRUE)
## bootstrap resamples
resamples = matrix(sample(x,
                          n * B,
                          replace = TRUE),
                   B, n)
resampledMeans = apply(resamples, 1, mean)
g1 <- ggplot(as.data.frame(prop.table(table(x))), aes(x = x, y = Freq)) + geom_bar(colour = "black", fill = "lightblue", stat = "identity") 
g2 <- ggplot(data.frame(x = resampledMeans), aes(x = x)) + geom_histogram(binwidth=.2, colour = "black", fill = "salmon", aes(y = ..density..)) 
grid.arrange(g1, g2, ncol = 2)

#consider a data set

library(UsingR)
data(father.son)
x <- father.son$sheight
n <- length(x)
B <- 10000
resamples <- matrix(sample(x,
                           n * B,
                           replace = TRUE),
                    B, n)
resampledMedians <- apply(resamples, 1, median)

#a plot of the histogram of the resamples

g = ggplot(data.frame(x = resampledMedians), aes(x = x)) 
g = g + geom_density(size = 2, fill = "red")
g = g + geom_histogram(alpha = .20, binwidth=.3, colour = "black", fill = "blue", aes(y = ..density..)) 
g = g + geom_vline(xintercept = median(x), size = 2)

#bootstrap algorithm example

B <- 10000
resamples <- matrix(sample(x,
                           n * B,
                           replace = TRUE),
                    B, n)
medians <- apply(resamples, 1, median)
sd(medians)
quantile(medians, c(.025, .975))

#histogram of bootstrap resamples

g = ggplot(data.frame(medians = medians), aes(x = medians))
g = g + geom_histogram(color = "black", fill = "lightblue", binwidth = 0.05)
g

#group comparisons

data(InsectSprays)
g = ggplot(InsectSprays, aes(spray, count, fill = spray))
g = g + geom_boxplot()
g

#permutation test b v c

subdata <- InsectSprays[InsectSprays$spray %in% c("B", "C"),]

y <- subdata$count

group <- as.character(subdata$spray)

testStat <- function(w, g) mean(w[g == "B"]) - mean(w[g == "C"])

observedStat <- testStat(y, group)

permutations <- sapply(1 : 10000, function(i) testStat(y, sample(group)))

observedStat

mean(permutations > observedStat)

g

#histogram of permutations b v c

g = ggplot(data.frame(permutations = permutations),
           aes(permutations))
g = g + geom_histogram(fill = "lightblue", color = "black", binwidth = 1)
g = g + geom_vline(xintercept = observedStat, size = 2)
g