#       Load the data, keeping only what we need
if (!exists("allData")) {
        filename <- "../exdata-data-household_power_consumption/household_power_consumption.txt"
        allData <- read.table(filename,sep=";",header=TRUE,stringsAsFactors=FALSE, dec=".")
}
#       Next line is very sensitive to strings used, must use this format date
data <- allData[allData$Date %in% c("1/2/2007","2/2/2007"),]

#       Need to combine date and time columns together for this plot
combined <- paste(data$Date,data$Time,sep=" ")
dateTime <- strptime(combined,"%d/%m/%Y %H:%M:%S")

#       Get the submetering columns
sm1 <- as.numeric(data$Sub_metering_1)
sm2 <- as.numeric(data$Sub_metering_2)
sm3 <- as.numeric(data$Sub_metering_3)
globalActivePower <- as.numeric(data$Global_active_power)
voltage <-as.numeric(data$Voltage)
globalReactivePower <- as.numeric(data$Global_reactive_power)

#       Now make the plot
png("plot4.png", width=500, height=500)

par(mfrow = c(2, 2)) 

#       Plot 1
plot(dateTime,globalActivePower,type="l",xlab="",ylab = "Global Active Power")

#       Plot 2
plot(dateTime,voltage,type="l",xlab="datetime",ylab="Voltage")

#       Plot 3
plot(dateTime, sm1, type="l", xlab="", ylab="Energy sub metering")
lines(dateTime,sm2, type="l",col="red")
lines(dateTime,sm3, type="l", col="blue")
legend("topright", lty=1,
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"))

#       Plot 4
plot(dateTime,globalReactivePower,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()


