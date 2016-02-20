#       Load the data, keeping only what we need
if (!exists("allData")) {
        filename <- "../exdata-data-household_power_consumption/household_power_consumption.txt"
        allData <- read.table(filename,sep=";",header=TRUE,stringsAsFactors=FALSE, dec=".")
}
#       Next line is very sensitive to strings used, must use this format date
data <- allData[allData$Date %in% c("1/2/2007","2/2/2007"),]


globalActivePower <- as.numeric(data$Global_active_power)

png("plot1.png", width=500, height=500)
hist(globalActivePower,col="red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()
