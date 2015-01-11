## assign input file
dataFile <- "./data/household_power_consumption.txt"

## Read data file
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## extract data from 20070201 to 20070202
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## get Global_active_power column
HPower <- as.numeric(subSetData$Global_active_power)

## assign output format and size
png("plot1.png", width=480, height=480)

## plot the histogram
hist(HPower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## close
dev.off()
