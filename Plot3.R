library(data.table)
library(ggplot2)
elec <- fread("c:/users/dnlebaron/documents/household_power_consumption.txt", header=TRUE, na.strings = "?", stringsAsFactors = FALSE,  sep = ";")
subElec <- elec[elec$Date %in% c("1/2/2007", "2/2/2007"), ]
datetime <- strptime(paste(subElec$Date, subElec$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
ggplot(subElec, aes(datetime) + geom_line(subElec$Sub_metering_1))
