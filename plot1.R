##Load the dataset.
file <- "./household_power_consumption.txt"
data <- read.table (file,header=TRUE,sep=";",colClasses=c("character","character",rep("numeric",7)),na="?")

##only data of 2 days is needed.
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

globalActivePower <- as.numeric (subsetData$Global_active_power)
png("plot1.png",width=480,height=480)
hist(globalActivePower,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",breaks=12,ylim=c(0,1200))
dev.off()
