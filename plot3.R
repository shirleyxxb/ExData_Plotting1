##Reading dataset
initial <- read.csv("household_power_consumption.txt", header=TRUE,nrows = 100,sep = ";") 
classes <- sapply(initial, class)
data <-read.csv("household_power_consumption.txt", header=TRUE,sep = ";",na.strings = "?",skip=66636,nrow=2880,colClasses = c("character",classes[2:9]))
colnames(data)<-colnames(initial)
##Transforming the time and date
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
datatime<-weekdays(datetime)
##Ploting
png("plot2.png", width=480, height=480)
plot(datetime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, data$Sub_metering_2, type="l", col="red")
lines(datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()