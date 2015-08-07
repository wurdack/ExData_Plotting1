## Generate plot #3
##
par(mfrow=c(1,1))

with(table, plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(table, points(DateTime, Sub_metering_1, type="l"))
with(table, points(DateTime, Sub_metering_2, type="l", col="red"))
with(table, points(DateTime, Sub_metering_3, type="l", col="blue"))

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
