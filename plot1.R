projectfile <- read.csv("household_power_consumption.txt", sep=";")
projdata <- projectfile[projectfile$Date=="1/2/2007",]
projdata2 <- projectfile[projectfile$Date=="2/2/2007",]
projdata3 <- merge(projdata, projdata2, all=TRUE)
gap <- as.numeric(projdata3$Global_active_power)
png(filename="plot1.png")
hist(gap, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()