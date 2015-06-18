#set working directory and appropriate R packages.
setwd("/Users/josephaddonisio/Downloads/Cousera/Exploratory Data Analysis/Project 2")
library(dplyr)

#define data.frame
NEI <- readRDS("summarySCC_PM25.rds")


#create table of total pollution grouped by year 
by.year <- group_by(NEI, year)
pol.tot.byyear <- summarise(by.year, Emissions = sum(Emissions))

#create and label bar chart summarising pollution data 
png('plot1.png')
barplot(height=pol.tot.byyear$Emissions, names.arg=pol.tot.byyear$year, xlab="Years", ylab=expression('Total PM'[2.5]*' emissions'),main=expression('Total PM'[2.5]*' emissions from 1999 to 2008'))
dev.off()