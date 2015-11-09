projectfile <- read.csv("household_power_consumption.txt", sep=";")
projdata <- projectfile[projectfile$Date=="1/2/2007",]
projdata2 <- projectfile[projectfile$Date=="2/2/2007",]
projdata3 <- merge(projdata, projdata2, all=TRUE)
#projdata4 <- with(  projdata3, data.frame( strptime(Date, format="%d/%m/%Y"), strptime(Time, format="%H:%M:%S"), as.numeric(Global_active_power), as.numeric(Global_reactive_power), as.numeric(Voltage), as.numeric(Global_intensity), as.numeric(Sub_metering_1), as.numeric(Sub_metering_2), as.numeric(Sub_metering_3) )  )
#Probably a better way to skip to projdata4 in 1 step, let me know in comments
#colnames(projdata4)<- colnames(projdata3) #sane column names
projdata5 <- with(  projdata3, data.frame( strptime(paste(Date, " ", Time), format="%d/%m/%Y %H:%M:%S"), as.numeric(Global_active_power), as.numeric(Global_reactive_power), as.numeric(Voltage), as.numeric(Global_intensity), as.numeric(Sub_metering_1), as.numeric(Sub_metering_2), as.numeric(Sub_metering_3) )  )
colnames(projdata5) <- colnames(projdata3)[2:9]
colnames(projdata5)[1]="Date"

png(filename="plot3.png")
plot(projdata5$Date, projdata5$Sub_metering_1, ylab="Energy Sub Metering", xlab="", type="n")
plot(projdata5$Date, projdata5$Sub_metering_1, ylab="Energy Sub Metering", xlab="", type="l")
lines(projdata5$Date, projdata5$Sub_metering_2, col="red")
lines(projdata5$Date, projdata5$Sub_metering_3, col="blue")
dev.off()