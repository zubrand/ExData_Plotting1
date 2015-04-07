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


# Chart 2
png(filename = 'plot2.png',width = 480,height = 480,units = 'px',bg = 'transparent')
par(mfrow=c(1,1), mar = c(5.1,4.1,4.1,2.1), bg='transparent')
plot(Global_active_power ~ Date, data = data, type = 'l',ylab = 'Global Active Power (kilowatts)', xlab = '')
dev.off()