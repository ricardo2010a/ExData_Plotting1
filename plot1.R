# Plot 1
Sys.setlocale("LC_ALL","English")
d = read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = c("character", "character", rep("numeric", 7)), na.strings="?")
date = as.Date(d$Date, format="%d/%m/%Y")
d[[1]] = date
d2 = d[d$Date >= as.Date("2007-02-01") & d$Date <= as.Date("2007-02-02") ,]
hist(d2$Global_act, col="red", breaks=12, xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
