# install.packages(c("gdata", "data.table", "dplyr"))

library(data.table)
library(dplyr)
library(gdata) 
library(hms)

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "dataset.zip")
unzip(zipfile = "dataset.zip", exdir = ".")

# object size
object.size(fread("household_power_consumption.txt"))

# in megabytes -> humanReadable from gdata package
# https://stackoverflow.com/questions/29787452/how-do-i-quickly-convert-the-size-element-of-file-info-from-bytes-to-kb-mb-g
humanReadable(object.size(fread("household_power_consumption.txt")))

consumption <- fread(file = "household_power_consumption.txt", na.strings="?")
selected_consumption <- subset(consumption, consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007")

selected_consumption$Date <- as.Date(selected_consumption$Date, format = "%d/%m/%Y")
selected_consumption$Time <- as_hms(selected_consumption$Time)

# https://stackoverflow.com/questions/12034424/convert-hourminutesecond-hhmmss-string-to-proper-time-class

# create DateTime variable (with strptime i couldn't save as POSIXct directly in the dataframe, so i used as.POSIXct)
selected_consumption$DateTime <- as.POSIXct(paste(selected_consumption$Date, selected_consumption$Time))

