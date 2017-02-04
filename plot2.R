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

#make Plot 2
png(filename = "plot2.png")
plot(data$newdate, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()   
