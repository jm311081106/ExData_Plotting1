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
# play with plots
# histogram
png("plot1.png")
hist(data.feb$Global_active_power, col = "red", main = names(data.feb[3]), xlab = paste(names(data.feb[3]), " {kilowatts}"))
dev.off()