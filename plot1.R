## Generate Plot 1
par(mfrow=c(1,1))
with(table, hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
