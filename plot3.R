setwd("/home/jjacquet/Documents/JHU/04-ExploratoryAnalysis")

#read in dataset
data <- read.table(file="./data/household_power_consumption.txt",
           sep = ";", 
           colClasses = c("character", "character", "character", "character", "character", "character", "character", "character", "character"),
           header = TRUE)

library(lubridate) #for easy date conversion
data$newdate <- dmy_hms(paste(data$Date, data$Time))

library(dplyr) #to easily filter down dates
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
        
#transforming remainder variables to numeric - ? turn to NAs
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

#make Plot 3
png(filename = "plot3.png")
with(data, plot(newdate, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(data, points(newdate, Sub_metering_2, type = "l", col = "red"))
with(data, points(newdate, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = c(1,1,1) , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()   
