#please make sure the file is in your working directory
dataFile <- "household_power_consumption.txt"

#reading the file
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subsetting the data to the desired period of time
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#keeping the variable of interest
globalActivePower <- as.numeric(subSetData$Global_active_power)

#saving the plot as a png file
png("plot1.png", width=480, height=480)

#making the plot
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#closing it with style
dev.off() 
