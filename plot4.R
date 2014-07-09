## Download and unzip files
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="./Data.zip")
unzip("./Data.zip")

## Read data into R & format columns
data <- read.table("household_power_consumption.txt", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), header = TRUE, sep = ";")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

## Subset the data
sub <- subset(data, as.Date(data$DateTime) >= '2007-02-01' & as.Date(data$DateTime) <= '2007-02-02')

## Set the parameters & png file
png(filename = "plot4.png")
par(mfrow = c(2,2), mar=c(5,5,5,5))
## Plot 1
with(sub, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

## Plot 2
with(sub, plot(DateTime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))

## Plot 3
with(sub, plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(sub, lines(DateTime, Sub_metering_2, col = "red"))
with(sub, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", col = c("black","red","blue"), lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

## Plot 4
with(sub, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime"))
dev.off()