## Read in the relevant training datasets
housepower <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE)

## Convert date and time fields from "Character" format to "Date" and "Time" formats respectively
housepower$Date <- as.Date(housepower$Date, "%d/%m/%Y")
housepower$Time <- strptime(housepower$Time, "%H:%M:%S")

## Subset only data from 1 Feb 2007 or 2 Feb 2007
febpower<-subset(housepower, Date=="2007-02-01" | Date=="2007-02-02")

## Plot histogram of Global Active Power and save in .png format
png(filename="plot1.png", width=480, height=480)
hist(febpower$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()