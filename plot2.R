#reading and subsetting data
filename <- "household_power_consumption.txt"
powerdata <- read.table(filename,skip=1,sep=";")
names(powerdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(powerdata,powerdata$date=="1/2/2007" | powerdata$date="2/2/2007")

#create plot2 graph and png file
datetime <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(datetime, as.numeric(as.character(subpower$Global_active_power)), xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()