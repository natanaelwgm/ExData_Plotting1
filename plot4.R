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

## Plot 4
png(file = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
plot(data2$Datetime, data2$Global_active_power,
     type = "l",
     ylab = "Global Active Power",
     xlab = "")

plot(data2$Datetime, data2$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

plot(data2$Datetime, data2$Sub_metering_1,
     type = "l", col = "black",
     ylab = "Energy sub metering",
     xlab = "")
points(data2$Datetime, data2$Sub_metering_2,
       type = "l", col = "red")
points(data2$Datetime, data2$Sub_metering_3,
       type = "l", col = "blue")
legend("topright",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, bty = "n")

plot(data2$Datetime, data2$Global_reactive_power,
     type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime")

dev.off()