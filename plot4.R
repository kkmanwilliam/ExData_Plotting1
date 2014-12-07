setwd("~/Desktop/Programming/R for JHU/Course4 - Exploratory Data Analysis")
obj_file <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
obj_file$Date <- as.Date(obj_file$Date, format = "%d/%m/%Y")
obj_file <- subset(obj_file, subset = (Date == "2007-02-01" | Date == "2007-02-02"))

time_detailed <- paste(obj_file$Date, obj_file$Time)
obj_file$TimeDetailed <- as.POSIXct(time_detailed)

par(mfrow = c(2,2), family= "LiHei Pro")

plot(obj_file$Global_active_power ~ obj_file$TimeDetailed,
	type = "l",
	ylab = "Global Active Power(kilowatts)", 
	xlab = "",
	cex.lab=0.8,
	)

plot(obj_file$Voltage ~ obj_file$TimeDetailed,
	type = "l",
	ylab = "Voltage", 
	xlab = "datetime",
	cex.lab=0.8,
	)

with(obj_file, {plot(Sub_metering_1 ~ TimeDetailed,
					type = "l",ylab = "Energy sub metering", xlab = "")
	lines(Sub_metering_2 ~ TimeDetailed, col = "Red")
	lines(Sub_metering_3 ~ TimeDetailed, col = "Blue", cex.lab=0.8)
	})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=3, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.5)
# The label of weekdays might not work due to the language
# conflict in package since I am using a Chinese version :(

plot(obj_file$Global_reactive_power ~ obj_file$TimeDetailed,
	type = "l",
	ylab = "Global_reactive_power", 
	xlab = "datetime",
	cex.lab=0.8,
	)

# The label of weekdays might not work due to the language
# conflict in package since I am using a Chinese version :(
	
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()