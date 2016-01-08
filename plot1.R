# ==================================================
# Coursera - Exploratory Data Analysis Course
# Assignment - Week 1 
# ==================================================
# Plot 1
# --------------------------------------------------

# Note: I prefer to use the = assignment operator instead of <- 
#  because it's much easier to type.

# changing locale so that all plots display weekdays in English
Sys.setlocale("LC_ALL","English")

# read data from CSV file, 
# but only the relevant lines (2007-02-01 and 2007-02-01)
# this is accomplished by the use of parameters skip and nrows
d = read.table("household_power_consumption.txt", header=TRUE, sep=";", 
               colClasses = c("character", "character", rep("numeric", 7)), 
			   col.names  = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", 
			                  "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
			   na.strings="?", skip=66636, nrows=2880)
			   
# casting date from character to the right class ("Date")
d[[1]] = as.Date(d$Date, format="%d/%m/%Y")

# filter only the appropriate dates
# it's already been done during read.table() call, but why risk it? Let's err on the safe side
d2 = d[d$Date >= as.Date("2007-02-01") & d$Date <= as.Date("2007-02-02") ,]

# prepare PNG file for plotting, with the right dimensions 
png("./plot1.png", width = 480, height = 480)

# create the plot 
hist(d2$Global_act, col="red", breaks=12, xlab="Global Active Power (kilowatts)", main="Global Active Power")
 
# close the PNG device and get the plot saved to file
dev.off()