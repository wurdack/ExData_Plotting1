## Read household power data and plot stuff.

library(dplyr)
library(lubridate)

##
## Import power consumption data. Filter and mutate appropriately for 
## easier plotting goodness.
##
import_data <- function() {
    
    ## Grab the huge file.
    ##
    raw_data <- read.csv("household_power_consumption.txt", sep=";", na.strings=c("?"))
    
    ## Convert data frame to a table
    ##
    table <- tbl_df(raw_data)
    
    ## We will filter on the following dates
    ##
    dates = ymd(c("2007-02-01", "2007-02-02"))
    
    ## Fix up the date column, filter by date, then create a DateTime column.
    ##
    table <- table %>%
        mutate(Date = dmy(Date)) %>%
        filter(Date %in% dates) %>%
        mutate(DateTime = Date + hms(Time))
    
    ## At this point we have a table with data in a form we want.
    table
}

##
## Generates plot 1 from the assignment. Plot 1 is a histogram of Global
## active power bucketed in half killowatt chunks.
##
plot1 <- function(table) {
    par(mfrow=c(1,1))
    with(table, 
        hist(Global_active_power, 
            col="red", 
            main="Global Active Power", 
            xlab="Global Active Power (kilowatts)"))    
}

##
## Generates plot 2 from the assignment. Plot 2 is a line graph of Global
## active power over the course of two days.
##
plot2 <- function(table) {
    par(mfrow=c(1,1))
    with(table, 
        plot(DateTime, 
            Global_active_power, 
            type="l", 
            ylab="Global Active Power (kilowatts)"))
}

##
## Generates plot 3 from the assignment. Plot 3 is a line graph of three
## sub metering data sets over the course of two days.
##
plot3 <- function(table) {
    par(mfrow=c(1,1))

    with(table, plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
    with(table, points(DateTime, Sub_metering_1, type="l"))
    with(table, points(DateTime, Sub_metering_2, type="l", col="red"))
    with(table, points(DateTime, Sub_metering_3, type="l", col="blue"))
    
    legend("topright", 
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        lty=1, 
        col=c("black", "red", "blue"))        
}

##
## Generates plot 4 from the assignment. Plot 4 is a 2x2 matrix of plots:
## * Same Plot as plot #2
## * A plot of voltage over two days.
## * Slightly modified version of plot #3.
## * Plot of global reactive power over two days.
##
plot4 <- function(table) {
    # 2x2 set of plots
    par(mfrow=c(2,2))

    # Upper left corner is just plot 2 again
    #
    with(table, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))
    
    # Upper right is a new but trivial plot
    #
    with(table, plot(DateTime, Voltage, type="l"))
    
    # Lower left is the gnarly triple data source plot #3. Yes, we could have 
    # called out to plot3() but that plot has a subtely differnt legend. 
    #
    with(table, plot(DateTime, Sub_metering_1, type="n"))
    with(table, points(DateTime, Sub_metering_1, type="l"))
    with(table, points(DateTime, Sub_metering_2, type="l", col="red"))
    with(table, points(DateTime, Sub_metering_3, type="l", col="blue"))
    
    legend("topright", 
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        lty=1, 
        col=c("black", "red", "blue"), 
        bty="n")
    
    # Lower right is another new but trivial plot
    #
    with(table, plot(DateTime, Global_reactive_power, type="l"))        
}
