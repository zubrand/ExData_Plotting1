# Data load
rm(list = ls())
filepath <- 'household_power_consumption.txt'

DT <- read.table(file = filepath, sep = ";", quote = "", na.string = "?",header = TRUE, colClasses = c(rep("character",2),rep("numeric",7)))
data <- as.data.frame(DT[DT$Date == '1/2/2007' | DT$Date == '2/2/2007',])
rm(DT)
data_backup <- data
data <- data_backup
dates <- data.frame(d = strptime(paste(data_backup$Date, data_backup$Time,sep = " "), format = '%d/%m/%Y %H:%M:%S'))
data$Date <- dates$d
data <- data[,-2]


# Chart 4
png(filename = 'plot4.png',width = 480,height = 480,units = 'px',bg = 'transparent')
par(mfrow = c(2,2), mar=c(4,4,2,2), bg='transparent')
plot(Global_active_power ~ Date, data = data, type = 'l',ylab = 'Global Active Power (kilowatts)', xlab = '')

plot(Voltage ~ Date, data = data, type = 'l',xlab = 'datetime')

plot(Sub_metering_1 ~ Date, data = data, type = 'l', col = 'black', xlab = '', ylab = 'Energy sub metering')
lines(Sub_metering_2 ~ Date, data = data , col = 'red')
lines(Sub_metering_3 ~ Date, data = data , col = 'blue')
legend('topright',legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'),lty = 1)

plot(Global_reactive_power ~ Date, data = data, xlab = 'datetime', type = 'l')

dev.off()
