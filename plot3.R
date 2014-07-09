## Download and unzip files
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="./Data.zip")
unzip("./Data.zip")

## Read data into R & format columns
data <- read.table("household_power_consumption.txt", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), header = TRUE, sep = ";")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

## Subset the data
sub <- subset(data, as.Date(data$DateTime) >= '2007-02-01' & as.Date(data$DateTime) <= '2007-02-02')

## Generate and save the plot
png(filename = "plot3.png")
par(mar=c(3,5,1,1))
with(sub, plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(sub, lines(DateTime, Sub_metering_2, col = "red"))
with(sub, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", col = c("black","red","blue"), lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()