##Load the dataset.
file <- "./household_power_consumption.txt"
data <- read.table (file,header=TRUE,sep=";",colClasses=c("character","character",rep("numeric",7)),na="?")

##only data of 2 days is needed.
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

datetime <- strptime(paste(subsetData$Date,subsetData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")


globalActivePower <- as.numeric (subsetData$Global_active_power)
SubMetering1 <- as.numeric(subsetData$Sub_metering_1)
SubMetering2 <- as.numeric(subsetData$Sub_metering_2)
SubMetering3 <- as.numeric(subsetData$Sub_metering_3)

png("plot3.png",width=480,height=480)
plot(datetime, SubMetering1, type="l", ylab="Energy Submetering", xlab=" ")
lines(datetime, SubMetering2, col="red")
lines(datetime, SubMetering3, col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=2.5)
dev.off()
