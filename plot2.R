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

#saving the PNG file
png("plot2.png", width=480, height=480)

#making the plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#closing it with style
dev.off() 
