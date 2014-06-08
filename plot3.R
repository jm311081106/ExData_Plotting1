# Read file into memory
# source file must be in working directory or accessible
# this code assumes source file is in working directory
data1 <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", as.is = 1:2,header = TRUE)
# subset the data for february 1st and 2nd only
data.feb <- data1[data1$Date == "2/2/2007" | data1$Date == "1/2/2007",]
# combine date and time
data.feb$DateTime <- paste(data.feb$Date,data.feb$Time)
# put date and time in the correct format
data.feb$DateTime <- strptime(data.feb$DateTime, format = "%d/%m/%Y %H:%M:%S")

# plot 3
png("plot3.png")
plot(data.feb$DateTime, data.feb$Sub_metering_1, type ="l", ylab = "Energy Sub Metering", xlab = "")
lines(data.feb$DateTime, data.feb$Sub_metering_2, col="red")
lines(data.feb$DateTime, data.feb$Sub_metering_3, col="blue")
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty=c(1,1,1), col=c("black", "red","blue"))
dev.off()

