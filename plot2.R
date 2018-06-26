## load the dataset
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?")

## convert the Date variable to Date classes
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## subset the data
datause <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

## convert the Date and Time variables to Date/Time classes
datause$datetime <- strptime(paste(datause$Date, datause$Time), "%Y-%m-%d %H:%M:%S")

## plot 2
png("plot2.png", width=480, height=480)
with(datause, plot(datetime, Global_active_power, type = "l", xlab = "",
                   ylab = "Global Active Power (kilowatts)"))
dev.off()
