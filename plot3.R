# run common trunk of the code
source("start.R")

# open png Graphics File Device
png("plot3.png",  width = 480, height = 480)

# create plot
plot(selected_consumption$DateTime, selected_consumption$Sub_metering_1, 
     type = "l", 
     col = "black",
     xlab = "", 
     ylab= "Energy sub metering"
     )
lines(selected_consumption$DateTime, selected_consumption$Sub_metering_2, 
      type = "l", 
      col = "red"
      )
lines(selected_consumption$DateTime, selected_consumption$Sub_metering_3, 
      type = "l", 
      col = "blue"
)

# add legend
legend("topright", 
       lty = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"),
       )

# close Graphics File Device
dev.off()