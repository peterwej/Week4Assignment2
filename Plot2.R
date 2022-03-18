##  2 - Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (
##      fips == "24510"
##      fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

##      This first line will likely take a few seconds. Be patient!
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")

##      Subset fips

        Balt <- subset(NEI, fips == "24510")
        
##      Subset year

        balt99 <- subset(Balt, year=="1999")
        balt02 <- subset(Balt, year=="2002")
        balt05 <- subset(Balt, year=="2005")
        balt08 <- subset(Balt, year=="2008")
      
##      summarize total emission
        
        sum1999 <- sum(balt99$Emissions)
        sum2002 <- sum(balt02$Emissions)
        sum2005 <- sum(balt05$Emissions)
        sum2008 <- sum(balt08$Emissions)

##      Create df
        
        total2 <- c(sum1999, sum2002, sum2005, sum2008)
        years2 <- c("1999", "2002", "2005", "2008")
        df2 <- data.frame(years2, total2)

##      plot
        
        barplot(total2, names.arg=years2, main="Total PM2.5 emissions in Baltimore", ylab="Tons of emissions", xlab="Year")
        
##      Export plot
        
        dev.copy(png, file = "Plot2.png")
        
        dev.off()
        
        