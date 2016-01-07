# Plot 2
Sys.setlocale("LC_ALL","English")
d = read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = c("character", "character", rep("numeric", 7)), na.strings="?")
date = as.Date(d$Date, format="%d/%m/%Y")
d[[1]] = date
d2 = d[d$Date >= as.Date("2007-02-01") & d$Date <= as.Date("2007-02-02") ,]
d2t = as.POSIXct(paste(d2$Date, d2$Time), format="%Y-%m-%d %H:%M:%S")
plot(d2t, d2$Global_act, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(d2t, d2$Global_act)
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()
