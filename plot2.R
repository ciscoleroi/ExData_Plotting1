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
png('plot2.png')

#plot
plot(data$Time, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#close device
dev.off()