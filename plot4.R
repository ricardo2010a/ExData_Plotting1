# ==================================================
# Coursera - Exploratory Data Analysis Course
# Assignment - Week 1 
# ==================================================
# Plot 4
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
png("./plot4.png", width = 480, height = 480)

# convert date+time variables into POSIXct type
d2t = as.POSIXct(paste(d2$Date, d2$Time), format="%Y-%m-%d %H:%M:%S")

# configure plotting system to make room for 4 plots in one file
par(mfrow=c(2,2))
 
# create the plot  
plot(d2t, d2$Global_act, type="n", ylab="Global Active Power", xlab="")
lines(d2t, d2$Global_act)
 
plot(d2t, d2$Voltage, type="n", ylab="Voltage", xlab="datetime")
lines(d2t, d2$Voltage)
 
plot(d2t, d2$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(d2t, d2$Sub_metering_1, col="black")
lines(d2t, d2$Sub_metering_2, col="red")
lines(d2t, d2$Sub_metering_3, col="blue")
legend("topright", lty=c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
 
plot(d2t, d2$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")
lines(d2t, d2$Global_reactive_power)
 
# create the plot 
dev.off()
