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
png(filename = "plot2.png")
par(mar=c(3,5,1,1))
with(sub, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()