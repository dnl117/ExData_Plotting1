#Read in the data
library(data.table)
elec <- fread("c:/users/dnlebaron/documents/household_power_consumption.txt", header=TRUE, na.strings = "?", stringsAsFactors = FALSE,  sep = ";")

#Select appropriate dates and create date variable
elec2 <- elec[elec$Date %in% c("1/2/2007", "2/2/2007"), ]
datetime <- strptime(paste(elec2$Date, elec2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Create the plot
png("Plot2.png", 480, 480)
plot(datetime, as.numeric(elec2$Global_active_power), type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
