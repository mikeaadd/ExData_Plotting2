#set working directory and appropriate R packages.
setwd("/Users/josephaddonisio/Downloads/Cousera/Exploratory Data Analysis/Project 2")
library(dplyr)

#define data.frame
NEI <- readRDS("summarySCC_PM25.rds")


#define baltimore pollution subset
pol.baltimore <- NEI[NEI$fips=="24510", ]


#create table of total pollution grouped by year for baltimore pollution subset
by.year <- group_by(pol.baltimore, year)
pol.tot.byyear <- summarise(by.year, Emissions = sum(Emissions))

#create and label bar chart summarising pollution data 
png('plot2.png')
barplot(height=pol.tot.byyear$Emissions, names.arg=pol.tot.byyear$year, xlab="Years", ylab=expression('Total PM'[2.5]*' emissions in Baltimore'),main=expression('Total PM'[2.5]*' emissions from 1999 to 2008 in Baltimore'))
dev.off()