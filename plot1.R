setwd("/home/jjacquet/Documents/JHU/04-ExploratoryAnalysis")

#read in dataset
data <- read.table(file="./data/household_power_consumption.txt",
           sep = ";", 
           colClasses = c("character", "character", "character", "character", "character", "character", "character", "character", "character"),
           header = TRUE)

library(lubridate) #for easy date conversion
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

library(dplyr) #to easily filter down dates
data <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")
        
#transforming remainder variables to numeric - ? turn to NAs
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

#make Plot 1
png(filename = "plot1.png")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()   
