## 
## plot3.R - Generates plot3.png
##
## This script is a wrapper around functions to load and plot data for 
## course project 1. See main.R for code that loads the data and Generates
## the plot. 
##
source("main.R")

## Retain current graphics device.
prev_dev = dev.cur()

## Import the data
table <- import_data()

## Plot to PNG file.
png(filename="plot3.png", width = 480, height = 480)
plot3(table)
dev.off()

## Restore previous graphics device.
dev.set(prev_dev)
