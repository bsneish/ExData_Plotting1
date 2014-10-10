power<-read.table("household_power_consumption.txt", na.strings="?", sep=";", header=TRUE)
power<-power[power$Date=="1/2/2007"|power$Date=="2/2/2007",]
power$Time<-strptime(paste(power$Date,power$Time), "%d/%m/%Y%H:%M:%S")

par(mfrow=c(1,1))
hist(power$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()

