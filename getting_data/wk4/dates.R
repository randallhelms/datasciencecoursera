#working with dates

d1 = date() #current date

d2 = Sys.Date() #date absent time

#reformat the date following this schema

#%d = day as number
#%a = abbreviated weekday
#%A = unabbreviated weekday
#%m = month (number)
#%b = abbreviated month
#%B = unabbreviated month
#%y = 2-digit year
#%Y = 4-digit year

format(d2,"%a %b %d")

x = c("1jan1960","2jan1960","3mar1960","30jul1960"); z = as.Date(x,"%d%b%Y")

#check difference in time

z[1] - z[2]

as.numeric(z[1]-z[2]) 

#convert them to Julian

weekdays(d2)

months(d2)

julian(d2)

#lubridate package is really good for dates
#don't need to format dates

library(lubridate)

ymd("20160309") #year month day

mdy("08/06/2015") #month day year

dmy("05-12-14") #day month year

#can repeat for time

ymd_hms("05-12-14 10:12:35")

ymd_hms("05-12-14 10:12:35",tz="Europe/Berlin")

#some slightly different syntax in lubridate

x1 = dmy(c("1jan2013","2jan2013","31mar2013","4jul2013"))

wday(x1[4],label = TRUE) #gives you weekday for fourth value of x1