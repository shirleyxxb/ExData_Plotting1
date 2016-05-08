##Reading dataset
initial <- read.csv("household_power_consumption.txt", header=TRUE,nrows = 100,sep = ";") 
classes <- sapply(initial, class)
data <-read.csv("household_power_consumption.txt", header=TRUE,sep = ";",na.strings = "?",skip=66636,nrow=2880,colClasses = c("character",classes[2:9]))
colnames(data)<-colnames(initial)

##Ploting
globalActivePower <- as.numeric(data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()