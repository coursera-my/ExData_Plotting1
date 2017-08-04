#reading and subsetting data
filename <- "household_power_consumption.txt"
powerdata <- read.table(filename,skip=1,sep=";")
names(powerdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(powerdata,powerdata$Date=="1/2/2007" | powerdata$Date=="2/2/2007")

#create plot3 graph and png file
datetime <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

#1
plot(datetime, as.numeric(as.character(subpower$Global_active_power)), xlab="", ylab="Global Active Power", type="l")

#2
plot(datetime, as.numeric(as.character(subpower$Voltage)), xlab="datetime", ylab="Voltage", type="l")

#3
plot(datetime, as.numeric(as.character(subpower$Sub_metering_1)), type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, as.numeric(as.character(subpower$Sub_metering_2)), type="l", col="red")
lines(datetime, as.numeric(as.character(subpower$Sub_metering_3)), type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),box.lwd = 0)

#4
plot(datetime, as.numeric(as.character(subpower$Global_reactive_power)), xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()