## load the dataset
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?")

## convert the Date variable to Date classes
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## subset the data
datause <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

## convert the Date and Time variables to Date/Time classes
datause$datetime <- strptime(paste(datause$Date, datause$Time), "%Y-%m-%d %H:%M:%S")

## plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

with(datause, plot(datetime, Global_active_power, type = "l", xlab = "",
                   ylab = "Global Active Power"))

with(datause, plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

with(datause, plot(datetime, Sub_metering_1, type = "l", xlab = "",
                   ylab = "Energy sub metering"))
with(datause, lines(datetime, Sub_metering_2, type = "l", col = "red"))
with(datause, lines(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", col = c("black", "red", "blue"), lty = 1, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(datause, plot(datetime, Global_reactive_power, type = "l", 
                   xlab="datetime", ylab="Global_reactive_power"))

dev.off()
