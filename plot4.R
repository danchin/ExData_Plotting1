## Read in the relevant training datasets
housepower <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE)

## Create new column combining Date and Time fields and call it DateTime
DateTime <- paste(housepower$Date, housepower$Time)
housepower <- cbind (housepower, DateTime)

## Convert date and time fields from "Character" format to "Date" and "Time" formats respectively
housepower$Date <- as.Date(housepower$Date, "%d/%m/%Y")
housepower$Time <- strptime(housepower$Time, "%H:%M:%S")
housepower$DateTime <- strptime(housepower$DateTime, "%d/%m/%Y %H:%M:%S")

## Subset only data from 1 Feb 2007 or 2 Feb 2007
febpower<-subset(housepower, Date=="2007-02-01" | Date=="2007-02-02")

## Set global charting parameters
png(filename="plot4.png", width=480, height=480)
par(mfcol=c(2,2))

## plot 1st Chart
with(febpower,plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

## plot 2nd Chart
with(febpower, plot(DateTime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
with(febpower, points(DateTime, Sub_metering_1, type="l", col="black"))
with(febpower, points(DateTime, Sub_metering_2, type="l", col="red"))
with(febpower, points(DateTime, Sub_metering_3, type="l", col="blue"))
legend ("topright", col=c("black", "red", "blue"),lty=1, bty="n", y.intersp = 0.5, legend =c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

## plot 3rd Chart
with(febpower, plot(DateTime, Voltage, type="l", ylab="Voltage", xlab="datetime"))

## plot 4th Chart
with(febpower, plot(DateTime, Global_reactive_power, type="l", xlab="datetime"))

dev.off()