power<-read.table("household_power_consumption.txt", na.strings="?", sep=";", header=TRUE)
power<-power[power$Date=="1/2/2007"|power$Date=="2/2/2007",]
power$Time<-strptime(paste(power$Date,power$Time), "%d/%m/%Y%H:%M:%S")

par(mfrow=c(1,1))
with(power, plot(Time, Global_active_power, ylab="Global Active Power (killowatts)", xlab="", type="l"))
dev.copy(png, file="plot2.png")
dev.off()

