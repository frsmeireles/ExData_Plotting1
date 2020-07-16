plot(hpc$Global_active_power~hpc$dateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()