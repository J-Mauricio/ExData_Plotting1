## It builds the Plot 1 of Peer Assessment 1
## of Exploratory Data Analysis of Coursera

## Setting and adjusting the target device
png(filename = "plot1.png", width = 480, height = 480, units = "px", 
    bg = "transparent")

## selecting only the needed lines from the data source 
## (requires package "sqldf")
mySql <- "SELECT * from file WHERE date = '1/2/2007' OR date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
myData <- read.csv.sql(myFile,mySql, sep=";")

## building the plotting
hist(myData$Global_active_power, main = "Global Active Power", 
     col = "red", xlab = "Global Active Power (kilowatts)")

## closing the device
dev.off()
