library(data.table)
library(plyr)
library(ggplot2)
library(scales)

stormdataALL <- fread("repdata_data_StormData.csv",sep=",",verbose=TRUE,header=TRUE)

#subset the physical and economic damage columns

stormdata <- stormdataALL[,.(EVTYPE,FATALITIES, INJURIES, PROPDMG, PROPDMGEXP, CROPDMG, CROPDMGEXP)]

#have a look at the stormdata info

head(stormdata)

str(stormdata)

names(stormdata)

#create formula for calculating cost

value <- function(x) {
  if (x %in% c("h", "H"))
    return(2)
  else if (x %in% c("k", "K"))
    return(3)
  else if (x %in% c("m", "M"))
    return(6)
  else if (x %in% c("b", "B"))
    return(9)
  else if (!is.na(as.numeric(x))) 
    return(as.numeric(x))
  else if (x %in% c("", "-", "?", "+"))
    return(0)
  else {
    stop("Invalid value.")
  }
}

#apply formula to each cost type

propCost <- sapply(stormdata$PROPDMGEXP,FUN=value)
cropCost <- sapply(stormdata$CROPDMGEXP,FUN=value)

#create new columns with total damage costs

stormdata$property_damage <- stormdata$PROPDMG * (10 ** propCost)
stormdata$crop_damage <- stormdata$CROPDMG * (10 ** cropCost)

#remove property and crop damage columns now that we have the total costs

stormdata <- stormdata[,c("PROPDMG","PROPDMGEXP","CROPDMG","CROPDMGEXP"):=NULL]

#aggregate by event type

stormdata <- stormdata[,lapply(.SD,sum),by=EVTYPE]

#add new columns for totals

stormdata$casualties <- stormdata$FATALITIES + stormdata$INJURIES
stormdata$totalcost <- stormdata$property_damage + stormdata$crop_damage

#change column names

colnames(stormdata) <- c('event_type','fatalities','injuries','property_damage','crop_damage','casualties','total_cost')

#check means and medians

mean_casualties <- mean(stormdata$casualties)
median_casualties <- median(stormdata$casualties)
mean_cost <- mean(stormdata$total_cost)
median_cost <- median(stormdata$total_cost)

#create summary data tables for each question

stormdata_casualties <- stormdata[,c(1:3,6),with=FALSE]
stormdata_costs <- stormdata[,c(1,4:5,7),with=FALSE]

#reorder each data table in descending order by totals

stormdata_casualties <- stormdata_casualties[order(-casualties)]
stormdata_costs <- stormdata_costs[order(-total_cost)]

#rework the data tables to have a top 10 and an 'other' row, summarizing the values of everything outside the top 10 events

top10_casualties <- stormdata_casualties[1:10,]
top10_costs <- stormdata_costs[1:10,]

other_casualties <- stormdata_casualties[11:985,]
other_costs <- stormdata_costs[11:985,]

oc1 <- as.data.frame(other_casualties)
oc1 <- colSums(oc1[,2:4],na.rm=TRUE)
oc1 <- transpose(as.data.frame(oc1))
colnames(oc1) <- c('fatalities','injuries','casualties')
oc1$event_type <- 'OTHER'
oc1 <- oc1[c(4,1,2,3)]

stormdata_casualties <- rbind(top10_casualties,oc1)

oc2 <- as.data.frame(other_costs)
oc2 <- colSums(oc2[,2:4],na.rm=TRUE)
oc2 <- transpose(as.data.frame(oc2))
colnames(oc2) <- c('property_damage','crop_damage','total_cost')
oc2$event_type <- 'OTHER'
oc2 <- oc2[c(4,1,2,3)]

stormdata_costs <- rbind(top10_costs,oc2)

#add percentage summary columns

stormdata_casualties$pct_casualties <- 100 * (stormdata_casualties$casualties / sum(stormdata_casualties$casualties))
stormdata_costs$pct_costs <- 100 * (stormdata_costs$total_cost / sum(stormdata_costs$total_cost))

#plot question 1

stormdata_casualties$order <- 1:11
  
ggplot(stormdata_casualties,aes(x=reorder(event_type,-order),y=casualties))+
  geom_bar(fill="darkorchid4",stat="identity")+
  coord_flip()+
  ylab("Total casualties")+
  xlab("Event Type")+
  ggtitle("Deadliest Storm Types")

#plot question 2

stormdata_costs$order <- 1:11

ggplot(stormdata_costs,aes(x=reorder(event_type,-order),y=total_cost / 1000000000))+
  geom_bar(fill="darkolivegreen3",stat="identity")+
  coord_flip()+
  ylab("Total cost (in billions of dollars)")+
  xlab("Event Type")+
  ggtitle("Most Financially Expensive Storm Types")