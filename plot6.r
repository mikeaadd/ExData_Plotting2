#set working directory and appropriate R packages.
setwd("/Users/josephaddonisio/Downloads/Cousera/Exploratory Data Analysis/Project 2")
library(dplyr)

#define and merge data tables
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
dataset<- merge(NEI, SCC, by="SCC")

#define and filter rows for coal-related pollution

dataset.mtr.vhcl <- NEI %>%
						filter(fips=="24510"|fips=="06037", type == "ON-ROAD") %>%
						group_by(year,fips) %>%
						summarise(Emissions = sum(Emissions))

#create and label bar chart summarising coal pollution data 
# png('plot5.png')
# barplot(height=dataset.bal$Emissions, names.arg=dataset.bal$year, xlab="Years", ylab=expression('Total PM'[2.5]*' emissions from Motor Vehicles in Baltimore'),
# 		main=expression('Total PM'[2.5]*' Emissions from Motor Vehicles by Year in Baltimore'))
# dev.off()

png("plot6.png")
g <- ggplot(dataset.mtr.vhcl, aes(year, Emissions, color = factor(fips, labels = c("Los Angeles","Baltimore"))))
g <- g + geom_line() +
  xlab("Years") +
  ylab(expression('Total PM'[2.5]*" Emissions from Motor Vehicles")) +
  ggtitle('Total Emissions from Motor Vehicles by city from 1999 to 2008') +
  labs(color = "City")
 
print(g)
dev.off()