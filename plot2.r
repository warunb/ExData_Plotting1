# read in the data
classes <- c(rep("character", 2), rep("numeric", 7))
electrical <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=classes, na.strings="?")

# subset the appropriate days
electricaldays <- electrical[electrical$Date == "1/2/2007" | electrical$Date == "2/2/2007", ]

# create a new variable "dt"
dt <- paste(electricaldays$Date, electricaldays$Time)
electricaldays$dt <- strptime(dt, "%d/%m/%Y %H:%M:%S")

# Plot 2
png(file="plot2.png")
plot(electricaldays$dt, electricaldays$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()