#1

aggTotals <- aggregate(Emissions ~ year,NEI, sum) 
png("Eplot1.png",width=500,height=500,units="px",bg="transparent") 
barplot( (aggTotals$Emissions)/10^6, names.arg=aggTotals$year, xlab="Year", ylab="PM2.5 Emissions (10^6 Tons)", main="Total PM2.5 Emissions From All US Sources" ) 
dev.off() 

#2

# Subset NEI data by Baltimore's fip. 

baltimoreNEI <- NEI[NEI$fips=="24510",] 

# Aggregate using sum the Baltimore emissions data by year 

aggTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum) 

png("Eplot2.png",width=480,height=480,units="px",bg="transparent") 

barplot( aggTotalsBaltimore$Emissions, names.arg=aggTotalsBaltimore$year, xlab="Year", ylab="PM2.5 Emissions (Tons)", main="Total PM2.5 Emissions From all Baltimore City Sources" ) 

dev.off() 

#3

# Subset NEI data by Baltimore's fip. 

baltimoreNEI <- NEI[NEI$fips=="24510",] 

# Aggregate using sum the Baltimore emissions data by year 

aggTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum) 

png("Eplot3.png",width=480,height=480,units="px",bg="transparent") 

library(ggplot2) 

ggp <- ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) + geom_bar(stat="identity") + theme_bw() + guides(fill=FALSE)+ facet_grid(.~type,scales = "free",space="free") + labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type")) 

print(ggp) 

dev.off() 

#4

# Subset coal combustion related NEI data 

combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE) 

coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 

coalCombustion <- (combustionRelated & coalRelated) 

combustionSCC <- SCC[coalCombustion,]$SCC 
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,] 

png("plot4.png",width=480,height=480,units="px",bg="transparent") 

library(ggplot2) 

ggp <- ggplot(combustionNEI,aes(factor(year),Emissions/10^5)) + geom_bar(stat="identity",fill="grey",width=0.75) + theme_bw() + guides(fill=FALSE) + labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008")) 

print(ggp) 

dev.off() 

#5

# Gather the subset of the NEI data which corresponds to vehicles 

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE) 

vehiclesSCC <- SCC[vehicles,]$SCC 
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,] 

# Subset the vehicles NEI data to Baltimore's fip 

baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",] 

png("Eplot5.png",width=480,height=480,units="px",bg="transparent") 

library(ggplot2) 

ggp <- ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) + geom_bar(stat="identity",fill="grey",width=0.75) + theme_bw() + guides(fill=FALSE) + labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008")) 

print(ggp) 

dev.off() 