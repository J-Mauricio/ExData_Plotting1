## It builds the Plot 3 of Peer Assessment 1
## of Exploratory Data Analysis of Coursera

## adjusting time labelling to English
Sys.setlocale("LC_TIME", "English")

## Setting and adjusting the target device
png(filename = "plot3.png", width = 480, height = 480, units = "px", 
    bg = "transparent")

## selecting only the needed lines from the data source 
## (requires package "sqldf")
mySql <- "SELECT * from file WHERE date = '1/2/2007' OR date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
myData <- read.csv.sql(myFile,mySql, sep=";")

## creating DataTime column to be used in the graphic
myData$DateTime <- strptime(paste(myData[,1],myData[,2]), "%d/%m/%Y %H:%M:%S")

## building the plotting
plot(myData$DateTime, myData$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab = "")
points(myData$DateTime, myData$Sub_metering_2, col = "red", type = "l")
points(myData$DateTime, myData$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty = 1, col = c("black","red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

## closing the device
dev.off()