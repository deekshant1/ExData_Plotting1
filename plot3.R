file <- read.table("household_power_consumption.txt", sep = ";")

names(file)[1] <- "Date"
names(file)[2] <- "Time"
names(file)[3] <- "Global Active Power"
names(file)[4] <- "Global Reactive Power"
names(file)[5] <- "Voltage"
names(file)[6] <- "Global Intensity"
names(file)[7] <- "Sub Metering 1"
names(file)[8] <- "Sub Metering 2"
names(file)[9] <- "Sub Metering 3"

req_date <- subset(file, file$Date == "1/2/2007"| file$Date == "2/2/2007")

dates <- req_date$Date
times <- req_date$Time
date_time <- strptime(paste(dates, times, sep=" "), "%d/%m/%Y %H:%M:%S")
Global_Active_Power <- as.numeric(req_date$`Global Active Power`)
sub_metering_1 <- as.numeric(req_date$`Sub Metering 1`)
sub_metering_2 <- as.numeric(req_date$`Sub Metering 2`)
sub_metering_3 <- as.numeric(req_date$`Sub Metering 3`)

png("plot3.png", width = 480, height = 480)
plot(date_time, sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(date_time, sub_metering_2, type = "l", col = "red")
lines(date_time, sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()