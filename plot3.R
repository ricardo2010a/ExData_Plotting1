# Plot 3
Sys.setlocale("LC_ALL","English")
d = read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = c("character", "character", rep("numeric", 7)), na.strings="?")
date = as.Date(d$Date, format="%d/%m/%Y")
d[[1]] = date
d2 = d[d$Date >= as.Date("2007-02-01") & d$Date <= as.Date("2007-02-02") ,]
d2t = as.POSIXct(paste(d2$Date, d2$Time), format="%Y-%m-%d %H:%M:%S")
 
plot(d2t, d2$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(d2t, d2$Sub_metering_1, col="black")
lines(d2t, d2$Sub_metering_2, col="red")
lines(d2t, d2$Sub_metering_3, col="blue")
legend("topright", lty=c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
 
dev.copy(png, "plot3.png", width=480, height=480)
dev.off()
