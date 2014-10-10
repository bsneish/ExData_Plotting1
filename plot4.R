power<-read.table("household_power_consumption.txt", na.strings="?", sep=";", header=TRUE)
power<-power[power$Date=="1/2/2007"|power$Date=="2/2/2007",]
power$Time<-strptime(paste(power$Date,power$Time), "%d/%m/%Y%H:%M:%S")

par(mfrow=c(2,2))

with(power, plot(Time, Global_active_power, ylab="Global Active Power", xlab="", type="l"))

with(power, plot(Time, Voltage, ylab="Voltage", xlab="datetime", type="l"))

with(power, plot(Time, Sub_metering_1, ylab="Energy sub metering", xlab="", type="n"))
with(power, lines(Time, Sub_metering_1))
with(power, lines(Time, Sub_metering_2, col="red"))
with(power, lines(Time, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, col=c("black","red","blue"), bty="n")

with(power, plot(Time, Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l"))
dev.copy(png, file="plot4.png")
dev.off()