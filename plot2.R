# Read file into memory
# source file must be in working directory or accessible
# this code asume source file is in working directory
data1 <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", as.is = 1:2,header = TRUE)
# subset the data for february 1st and 2nd only
data.feb <- data1[data1$Date == "2/2/2007" | data1$Date == "1/2/2007",]
# combine date and time
data.feb$DateTime <- paste(data.feb$Date,data.feb$Time)
# put date and time in the correct format
data.feb$DateTime <- strptime(data.feb$DateTime, format = "%d/%m/%Y %H:%M:%S")
#
# line chart
png("plot2.png")
plot(data.feb$DateTime, data.feb$Global_active_power, type ="l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()