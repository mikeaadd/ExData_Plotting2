#set working directory and appropriate R packages.
setwd("/Users/josephaddonisio/Downloads/Cousera/Exploratory Data Analysis/Project 2")
library(dplyr)
library(ggplot2)

#define data.frame
NEI <- readRDS("summarySCC_PM25.rds")


#define baltimore pollution subset
pol.baltimore <- NEI[NEI$fips=="24510", ]


#create table of total pollution grouped by year and type for baltimore pollution subset
by.year.type <- group_by(pol.baltimore, type, year)
pol.tot.byyear.type <- summarise(by.year, Emissions = sum(Emissions))

#create and label ggplot summarising pollution data
png("plot3.png")
g <- ggplot(pol.tot.byyear.type, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("Years") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore by Type from 1999 to 2008')
print(g)
dev.off()