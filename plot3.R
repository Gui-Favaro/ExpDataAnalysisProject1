#please make sure the file is in your working directory
dataFile <- "household_power_consumption.txt"

#reading the file
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subsetting the data to the desired period of time
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#applying date and time formats
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#keeping the variable of interest
globalActivePower <- as.numeric(subSetData$Global_active_power)

#some other variables that we also have interest
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

#opening the PNG file
png("plot3.png", width=480, height=480)

#its timem to plot
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#closing it with style
dev.off() 
