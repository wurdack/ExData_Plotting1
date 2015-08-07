## Read household power data and plot stuff.

library(dplyr)
library(lubridate)

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
