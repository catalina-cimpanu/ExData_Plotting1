# run common trunk of the code
source("start.R")

# create DateTime variable (with strptimei couldn't save as POSIXct directly in the dataframe, so i used as.POSIXct)
selected_consumption$DateTime <- as.POSIXct(paste(selected_consumption$Date, selected_consumption$Time))

# open png Graphics File Device
png("plot2.png",  width = 480, height = 480)

# create plot
plot(selected_consumption$DateTime, selected_consumption$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)", 
     ylim = range(selected_consumption$Global_active_power)
     )

# close Graphics File Device
dev.off()