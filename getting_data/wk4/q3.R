#use data set from q2.R

#create regEx to count the number of countries beginning with "United"

countryNames = gdp$fullName

grep("*United",countryNames), 5 #good method, wrong result

grep("United$",countryNames), 3 #bad method

grep("^United",countryNames), 3 #good method, good result

grep("*United",countryNames), 2 #good method, wrong result