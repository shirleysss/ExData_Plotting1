## load the dataset
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?")

## convert the Date variable to Date classes
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## subset the data
datause <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

## plot 1
png("plot1.png", width=480, height=480)
with(datause, hist(Global_active_power, main = "Global Active Power",
                   xlab = "Global Active Power (kilowatts)", col = "red"))
dev.off()

