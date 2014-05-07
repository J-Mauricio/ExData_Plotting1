## It builds the Plot 4 of Peer Assessment 1
## of Exploratory Data Analysis of Coursera

## adjusting time labelling to English
Sys.setlocale("LC_TIME", "English")

## Setting and adjusting the target device
png(filename = "plot4.png", width = 480, height = 480, units = "px", 
    bg = "transparent")

## defining a panel for 4 graphics
par(mfcol = c(2,2))

## selecting only the needed lines from the data source 
## (requires package "sqldf")
mySql <- "SELECT * from file WHERE date = '1/2/2007' OR date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
myData <- read.csv.sql(myFile,mySql, sep=";")

## creating DataTime column to be used in the graphic
myData$DateTime <- strptime(paste(myData[,1],myData[,2]), "%d/%m/%Y %H:%M:%S")

## building the 1st graphic
plot(myData$DateTime, myData$Global_active_power, type = "l", 
     ylab = "Global Active Power", xlab = "")

## building the 2nd graphic
plot(myData$DateTime, myData$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xlab = "")
points(myData$DateTime, myData$Sub_metering_2, col = "red", type = "l")
points(myData$DateTime, myData$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty = 1, bty = "n", col = c("black","red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

## building the 3rd graphic
plot(myData$DateTime, myData$Voltage, type = "l", ylab = "Voltage", 
     xlab = "datetime")

## building the 4th graphic
plot(myData$DateTime, myData$Global_reactive_power, type = "l", 
     ylab = "Global_reactive_power", xlab = "datetime")

## closing the device
dev.off()