## Mega plot #4

# 2x2 set of plots
par(mfrow=c(2,2))

# Upper left corner is just plot 2 again
#
with(table, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))

# Upper right is a new but trivial plt
#
with(table, plot(DateTime, Voltage, type="l"))

# Lower left is the gnarly triple data source plot #3, with slightly different legend.
#
with(table, plot(DateTime, Sub_metering_1, type="n"))
with(table, points(DateTime, Sub_metering_1, type="l"))
with(table, points(DateTime, Sub_metering_2, type="l", col="red"))
with(table, points(DateTime, Sub_metering_3, type="l", col="blue"))

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")

# Lower right is another new but trivial plot
#
with(table, plot(DateTime, Global_reactive_power, type="l"))
