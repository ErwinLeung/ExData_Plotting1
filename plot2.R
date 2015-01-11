## assign input file
dataFile <- "./data/household_power_consumption.txt"

## read the data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## extract data from 20070201 to 20070202
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## read and format datetime column
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## read Global_active_power column
HPower <- as.numeric(subSetData$Global_active_power)

## assign output format ans size
png("plot2.png", width=480, height=480)

## plot the graph
plot(datetime, HPower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

##close
dev.off()
