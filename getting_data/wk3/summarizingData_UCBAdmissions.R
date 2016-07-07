#create cross tabs

data("UCBAdmissions")

DF = as.data.frame(UCBAdmissions)

summary(DF)

xt <- xtabs(Freq ~ Gender + Admit,data = DF)

#make flat tables

warpbreaks$replicate <- rep(1:9, len = 54)

xt = xtabs(breaks ~.,data = warpbreaks)

#make smaller, more compact table with ftable

ftable(xt)

#check size of a data set

fakeData = rnorm(1e5)

object.size(fakeData)

print(object.size(fakeData),units="Mb")