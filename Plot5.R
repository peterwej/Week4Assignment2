##  5 - How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

##      Load data

        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        
##      Subset fips, Baltimore city
        
        Balt <- subset(NEI, fips == "24510")
        
##      find vehicle
        
        vehicle <- grep("Vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)        
        SCC3 <- SCC[vehicle, ]
        
##      merge NEI and SCC
        
        merged2 <- merge(Balt, SCC3, by="SCC")
        
##      Subset by year and emissions
        
        n99 <- merged2 %>% filter(Emissions >= 0, year == "1999")
        o02 <- merged2 %>% filter(Emissions >= 0, year == "2002")
        o05 <- merged2 %>% filter(Emissions >= 0, year == "2005")
        o08 <- merged2 %>% filter(Emissions >= 0, year == "2008")
        
##      Sum of emissions
        
        sumn99 <- sum(n99$Emissions)
        sumo02 <- sum(o02$Emissions)
        sumo05 <- sum(o05$Emissions)
        sumo08 <- sum(o08$Emissions)
        
##      create data.frame and years.
        
        totales <- c(sumn99, sumo02,sumo05, sumo08)
        yearss <- c("1999", "2002", "2005", "2008")
        
##      plot graph
        
        barplot(totales,names.arg=yearss,xlab="Year",ylab="Emissions in tons", main="Emissions from motor vehicles in Baltimore")
        
##      Export graph in .png.
        
        dev.copy(png, file = "Plot5.png")
        
        dev.off()