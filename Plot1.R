## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Any missing values? No!

mean(is.na(NEI$Emissions))

## Subset the different years

nine <- subset(NEI, year == "1999")
two <- subset(NEI, year == "2002")
five <- subset(NEI, year == "2005")
eight <- subset(NEI, year == "2008")

## Total amount of emissions

sumnine <- sum(nine$Emissions)
sumtwo <- sum(two$Emissions)
sumfive <- sum(five$Emissions)
sumeight <- sum(eight$Emissions)

## Create data frame

total <- c(sumnine, sumtwo,sumfive, sumeight)
years <- c("1999", "2002", "2005", "2008")


## Create plot

barplot(total, names.arg=years, main="Total PM2.5 emissions", ylab="Tons of emissions", xlab="Year")

## Export plot

dev.copy(png, file = "Plot1.png")

dev.off()
