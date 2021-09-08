# run common trunk of the code
source("start.R")

# open png Graphics File Device
png("plot4.png",  width = 480, height = 480)

# set up the plot with 2 rows and 2 columns
par(mfrow = c(2, 2))

# create plots
with(selected_consumption, {
     # plot 1
     plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
     # plot 2
     plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
     # plot 3
     plot(DateTime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab= "Energy sub metering")
     lines(DateTime, Sub_metering_2, type = "l", col = "red")
     lines(DateTime, Sub_metering_3, type = "l", col = "blue")
     legend("topright", 
            lty = 1, 
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
            col = c("black", "red", "blue"),
     )
     # plot 4
     plot(DateTime, Global_reactive_power,type = "l",  ylim = range(0, 0.5), 
          xlab = "datetime", ylab = "Global Reactive Power")
     }
     )

# close Graphics File Device
dev.off()