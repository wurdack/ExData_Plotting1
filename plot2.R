## Generate second plot.
par(mfrow=c(1,1))
with(table, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))
