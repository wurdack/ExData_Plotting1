# Course Project 1

For the assignment details (originally README.md) see [Assignment.md](Assignment.md)

All the main functionality for importing data and plotting is included in [main.R](main.R).

There are four stand alone R source files, one for generating each plot. These may be either
sourced from RStudio or an R console by invoking

        source("plot1.R")

or by running R in batch mode _a la_

        r CMD BATCH plot1.R

The output of any one of these scripts is a corresponding PNG with the same name as the script (i.e.
plot1.R will output plot1.png).

Note that all scripts assume the current working directory also contains the already unzipped 
`household_power_consumption.txt` data set.

