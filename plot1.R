#reading and subsetting data
filename <- "household_power_consumption.txt"
powerdata <- read.table(filename,skip=1,sep=";")
names(powerdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(powerdata,powerdata$date=="1/2/2007" | powerdata$date="2/2/2007")

#create plot1 histogram & png file
png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
