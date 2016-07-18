#histogram example

x <- rnorm(100)
hist(x)

y <- rnorm(100)

plot(x,y) #scatterplot

par(mar = c(4,4,2,2)) #adjust margins

plot(x,y, pch = 4) #change plotting symbol

example(points) #see the different points type

pchShow() #see the different symbols

plot(x,y, pch = 20)

title("Scatterplot")

text(-2,-2, "Test") #add a bit of text

legend("topleft", legend = "Data Points")

fit <- lm(y ~ x) #create regression formula

abline(fit, lwd = 3, col = "orange")

plot(x,y, xlab = "Height", ylab = "Weight", main = "Scatterplot", pch = 20)

legend("topright", legend = "Data Points")

text(-2,-2, "Test")

#stack graphs with rearranged plotting

par(mfrow = c(2,1))

z <- rpois(100, 2)

plot(x,y, pch = 20)

plot(x,z, pch = 20)