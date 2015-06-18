#set working directory and appropriate R packages.
setwd("/Users/josephaddonisio/Downloads/Cousera/Exploratory Data Analysis/Project 2")
library(dplyr)

#define and merge data tables
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
dataset<- merge(NEI, SCC, by="SCC")

#define and filter rows for coal-related pollution
dataset.coal <- dataset %>%
					filter(grepl("coal",Short.Name,ignore.case = TRUE))
 
#create table of total pollution grouped by year
by.year <- group_by(dataset.coal, year)
pol.tot.byyear <- summarise(by.year, Emissions = sum(Emissions))

#create and label bar chart summarising coal pollution data 
png('plot4.png')
barplot(height=pol.tot.byyear$Emissions, names.arg=pol.tot.byyear$year, xlab="Years", ylab=expression('Total PM'[2.5]*' emissions in the United States'),main=expression('Total PM'[2.5]*' Emissions from Coal by Year in the United States'))
dev.off()