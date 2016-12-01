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

## Plot chart of Energy sub-metering and save in .png format
png(filename="plot3.png", width=480, height=480)
with(febpower, plot(DateTime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
with(febpower, points(DateTime, Sub_metering_1, type="l", col="black"))
with(febpower, points(DateTime, Sub_metering_2, type="l", col="red"))
with(febpower, points(DateTime, Sub_metering_3, type="l", col="blue"))
legend ("topright", col=c("black", "red", "blue"),lty=1, legend =c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()