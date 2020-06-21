data <- read.csv("household_power_consumption.txt", sep = ";")

library(lubridate)

data$Datetime <- paste(data$Date, data$Time, sep = " ")
head(data$Datetime)
data$Datetime <- dmy_hms(data$Datetime)
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

names(data)

#data2 <- data

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_intensity <- as.numeric(as.character(data$Global_intensity))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

#str(data)

data2 <- subset(data, Date == "2007-02-01" | Date == "2007-02-02" )
str(data2)

## Plot 1

png(file = "plot1.png", width = 480, height = 480, units = "px")
par(mfrow = c(1,1))
hist(data2$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()