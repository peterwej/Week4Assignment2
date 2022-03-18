## 3 -  Of the four types of sources indicated by the type type (point, nonpoint, onroad, nonroad) variable, 
##      which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
##      Which have seen increases in emissions from 1999–2008? 
##      Use the ggplot2 plotting system to make a plot answer this question.
       
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        
##      Load ggplot2
        
        library(ggplot2)

##      Subset fips

        Balt <- subset(NEI, fips == "24510")

##      Create factor of type
        
        Balt$year <- as.factor(Balt$year)
        Balt$type <-  as.factor(Balt$type)
        
##      create g, color by type
        
        g <- ggplot(Balt, aes(year, Emissions, fill = type))
        
##      create plot
        
        g+geom_bar(stat="identity")+facet_grid(. ~ type)+labs(title = "Emissions by type")
        
##      Export plot as png, make it a little wider for easier view of y-axis
        
        dev.copy(png, file = "Plot3.png", width = 960)
        
        dev.off()
        
        
        
        
        

