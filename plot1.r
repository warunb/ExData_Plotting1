# This code assumes that the 'Electrical Power Consumption' zipped file has been downloaded, unzipped and that the household_power_consumption.txt file has been put in the working directory

# read in the data
colcl <- c(rep("character", 2), rep("numeric", 7))
electrical <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = colcl, na.strings="?")

# subset the appropriate days
electricaldays <- electrical[electrical$Date == "1/2/2007" | electrical$Date == "2/2/2007", ]

# create a new variable "dt"
dt <- paste(electricaldays$Date, electricaldays$Time)
electricaldays$dt <- strptime(dt, "%d/%m/%Y %H:%M:%S")

# Plot 1
png(file="plot1.png")
hist(electricaldays$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()