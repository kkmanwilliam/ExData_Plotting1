setwd("~/Desktop/Programming/R for JHU/Course4 - Exploratory Data Analysis")
obj_file <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
obj_file$Date <- as.Date(obj_file$Date, format = "%d/%m/%Y")
obj_file <- subset(obj_file, subset = (Date == "2007-02-01" | Date == "2007-02-02"))

time_detailed <- paste(obj_file$Date, obj_file$Time)
obj_file$TimeDetailed <- as.POSIXct(time_detailed)

library(datasets)
par(mar = c(5,5,2,2), family= "LiHei Pro")
plot(obj_file$Global_active_power ~ obj_file$TimeDetailed,
	type = "l",
	ylab = "Global Active Power(kilowatts)", 
	xlab = ""
	)
# The label of weekdays might not work due to the language
# conflict in package since I am using a Chinese version :(

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
