power<-read.table("household_power_consumption.txt", na.strings="?", sep=";", header=TRUE)
power<-power[power$Date=="1/2/2007"|power$Date=="2/2/2007",]
power$Time<-strptime(paste(power$Date,power$Time), "%d/%m/%Y%H:%M:%S")

par(mfrow=c(1,1))
with(power, plot(Time, Sub_metering_1, ylab="Energy sub metering", xlab="", type="n"))
with(power, lines(Time, Sub_metering_1))
with(power, lines(Time, Sub_metering_2, col="red"))
with(power, lines(Time, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, col=c("black","red","blue"))
dev.copy(png, file="plot3.png")
dev.off()

