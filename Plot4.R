#Read in the data
library(data.table)
elec <- fread("c:/users/dnlebaron/documents/household_power_consumption.txt", header=TRUE, na.strings = "?", stringsAsFactors = FALSE,  sep = ";")

#Select appropriate dates and create date variable
elec2 <- elec[elec$Date %in% c("1/2/2007", "2/2/2007"), ]
datetime <- strptime(paste(elec2$Date, elec2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Create the plots using base graphics package
png("Plot4.png", 480, 480)
par(mfrow = c(2,2))
plot(datetime, as.numeric(elec2$Global_active_power), type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(datetime, elec2$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(datetime, elec2$Sub_metering_1, col = "black", ylab = "Energy sub metering", xlab="", type="l")
lines(datetime, elec2$Sub_metering_2, col = "red", type="l")
lines(datetime, elec2$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red", "blue"), lwd=1, cex=0.5, border = FALSE)
plot(datetime, elec2$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power",type="l")    
dev.off()
       