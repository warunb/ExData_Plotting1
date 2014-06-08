# read in the data
classes <- c(rep("character", 2), rep("numeric", 7))
electrical <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=classes, na.strings="?")

# subset the appropriate days
electricaldays <- electrical[electrical$Date == "1/2/2007" | electrical$Date == "2/2/2007", ]

# create a new variable "dt"
dt <- paste(electricaldays$Date, electricaldays$Time)
electricaldays$dt <- strptime(dt, "%d/%m/%Y %H:%M:%S")

# Plot 4
png(file="plot4.png")
par(mfrow=c(2,2))
# upper left plot:
plot(electricaldays$dt, electricaldays$Global_active_power, type="l", xlab="", ylab="Global Active Power")
# upper right plot:
plot(electricaldays$dt, electricaldays$Voltage, type="l", xlab="datetime", ylab="Voltage")
# lower left plot:
plot(electricaldays$dt, electricaldays$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(electricaldays$dt, electricaldays$Sub_metering_2, col="red")
lines(electricaldays$dt, electricaldays$Sub_metering_3, col="blue")
legend("topright", lty=1, bty="n", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# lower right plot:
plot(electricaldays$dt, electricaldays$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()