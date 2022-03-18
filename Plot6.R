##    6 - Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
##        sources in Los Angeles County, California (
##        fips == "06037"
##        fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

##      installing and loading packages

        library(ggplot2)
        library(dplyr)

##      Load data

        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        
##      Subset fips, Baltimore city and LA.
        
        Balt <- subset(NEI, fips == "24510")
        LA <- subset(NEI, fips == "06037")
        
##      find vehicle
        
        vehicle <- grep("Vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)        
        SCC3 <- SCC[vehicle, ]
        
##      merge NEI and SCC
        
        merged3 <- merge(Balt, SCC3, by="SCC")
        merged4 <- merge(LA, SCC3, by="SCC")
        
##      Subset by year and emissions
        
        b99 <- merged3 %>% filter(year == "1999")
        b02 <- merged3 %>% filter(year == "2002")
        b05 <- merged3 %>% filter(year == "2005")
        b08 <- merged3 %>% filter(year == "2008")
        
        la99 <- merged4 %>% filter(year == "1999")
        la02 <- merged4 %>% filter(year == "2002")
        la05 <- merged4 %>% filter(year == "2005")
        la08 <- merged4 %>% filter(year == "2008")
        
##      Sum of emissions
        
        sumb99 <- sum(b99$Emissions)
        sumb02 <- sum(b02$Emissions)
        sumb05 <- sum(b05$Emissions)
        sumb08 <- sum(b08$Emissions)
        
        sumla99 <- sum(la99$Emissions)
        sumla02 <- sum(la02$Emissions)
        sumla05 <- sum(la05$Emissions)
        sumla08 <- sum(la08$Emissions)
        
##      create data frame and years.
        
        totalbla <- c(sumb99, sumb02,sumb05, sumb08,sumla99, sumla02,sumla05, sumla08)
        years1 <- c("1999", "2002", "2005", "2008","1999", "2002", "2005", "2008")
        location <- c("Baltimore", "Baltimore","Baltimore","Baltimore", "LA","LA", "LA", "LA")
        
        dataframe <- data.frame(totalbla, years1, location)
        
##      plot
        
        ggplot()+geom_col(data=dataframe, aes(x=years1, y=totalbla, fill=location), 
        position="dodge")+labs(title="Emissions from motor vehicles, Baltimore and LA")+
        ylab("Emissions in tons")+xlab("Year")
        
##      Export graph in .png.
        
        dev.copy(png, file = "Plot6.png")
        
        dev.off()
        
        
        
        