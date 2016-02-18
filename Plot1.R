library(data.table)
elec <- fread("c:/users/dnlebaron/documents/household_power_consumption.txt", header=TRUE, na.strings = "?", stringsAsFactors = FALSE,  sep = ";")
subElec <- elec[elec$Date %in% c("1/2/2007", "2/2/2007"), ]
png("Plot1.png", 480, 480)
hist(as.numeric(subElec$Global_active_power), col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts")
dev.off()
