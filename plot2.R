## It builds the Plot 2 of Peer Assessment 1
## of Exploratory Data Analysis of Coursera

## adjusting time labelling to English
Sys.setlocale("LC_TIME", "English")

## Setting and adjusting the target device
png(filename = "plot2.png", width = 480, height = 480, units = "px", 
    bg = "transparent")

## selecting only the needed lines from the data source 
## (requires package "sqldf")
mySql <- "SELECT * from file WHERE date = '1/2/2007' OR date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
myData <- read.csv.sql(myFile,mySql, sep=";")

## creating DataTime column to be used in the graphic
myData$DateTime <- strptime(paste(myData[,1],myData[,2]), "%d/%m/%Y %H:%M:%S")

## building the plotting
plot(myData$DateTime, myData$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")

## closing the device
dev.off()