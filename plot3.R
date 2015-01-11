## assign input file
dataFile <- "./data/household_power_consumption.txt"

## read the data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## extract data from 20070201 to 20070202
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## read and format datetime column
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## read and format Sub_metering_1
subMetering1 <- as.numeric(subSetData$Sub_metering_1)

## read and format Sub_metering_2
subMetering2 <- as.numeric(subSetData$Sub_metering_2)

## read and format Sub_metering_3
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

## assign output file and size
png("plot3.png", width=480, height=480)

## plot subMetering1
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")

## assign red color to subMetering2
lines(datetime, subMetering2, type="l", col="red")

## assign blue color to subMetering2
lines(datetime, subMetering3, type="l", col="blue")

## format legend 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## close
dev.off()
