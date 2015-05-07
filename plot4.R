#read in data
fileName<-"household_power_consumption.txt"
data<-read.table(fileName,header=TRUE,na.strings=c("?"),sep=";")

#subset data, delete all irrelevant cases
data<-subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")

#convert date and time to POSIXlt
data$Time<-paste(data$Date,data$Time, sep=" ")
data$Date<-strptime(data$Date, "%d/%m/%Y")
data$Time<-strptime(data$Time, "%d/%m/%Y %H:%M:%S")


#open device 
png('plot4.png', width=504, height=504)

#set columnwise 2x2 plot stack
par(mfcol=c(2,2))

#plot 1
plot(data$Time, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#plot 2
plot(data$Time, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red", "blue"),bty="n", cex=0.75)

#plot 3
plot(data$Time, data$Voltage, type="l", ylab="Voltage", xlab="datetime")

#plot 4
plot(data$Time, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime", lwd=0.5)


#close device
dev.off()

