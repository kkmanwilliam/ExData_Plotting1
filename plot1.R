setwd("~/Desktop/Programming/R for JHU/Course4 - Exploratory Data Analysis")
obj_file <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")
obj_file$Date <- as.Date(obj_file$Date, format = "%d/%m/%Y")
obj_file <- subset(obj_file, subset = (Date == "2007-02-01" | Date == "2007-02-02"))

library(datasets)
par(mar = c(5,5,2,2), family= "LiHei Pro")
hist(obj_file$Global_active_power,
	main = "Global Active Power",
	xlab = "Global Active Power(kilowatts)", 
	col = "Red",
	)
y_axis <- c(seq(0, 1200, 200))
axis(2, at = y_axis)


dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
