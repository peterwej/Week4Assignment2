##  4 - Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

##      Load data

        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")

##      installing and loading packages
        
        library(dplyr)
        
##      Find Coal combustion
        
        coal <- grep("Coal", SCC$Short.Name, ignore.case=TRUE)        
        SCC2 <- SCC[coal, ]
        
##      Merge dataframes by columns
        
        merged <- merge(NEI, SCC2, by="SCC")
        
##      Subset by year
        
        n9 <- merged %>% filter(year == "1999")
        o2 <- merged %>% filter(year == "2002")
        o5 <- merged %>% filter(year == "2005")
        o8 <- merged %>% filter(year == "2008")
        
##      Sum of emissions
        
        sumn9 <- sum(n9$Emissions)
        sumo2 <- sum(o2$Emissions)
        sumo5 <- sum(o5$Emissions)
        sumo8 <- sum(o8$Emissions)
        
##      create data.frame and years.
        
        totales <- c(sumnn, sumo2,sumo5, sumo8)
        yearss <- c("1999", "2002", "2005", "2008")
        
##      plot graph
        
        barplot(totale,names.arg=years,xlab="Year",ylab="Total Coal Emissions", main="Coal Emissions by Year")
        
##      Export graph in .png.
        
        dev.copy(png, file = "Plot4.png")
        
        dev.off()
