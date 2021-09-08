# run common trunk of the code
source("start.R")

# open png Graphics File Device
png("plot1.png",  width = 480, height = 480)

# create histogram
hist(selected_consumption$Global_active_power, 
     col="red", 
     main = "Global Active Power",
     xlab = "Global ActivePower (kilowatts)",
     ylim = c(0, 1200)
     )

# close Graphics File Device
dev.off()