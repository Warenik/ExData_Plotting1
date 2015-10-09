Sys.setlocale("LC_ALL","English")
power.consump.data<-read.csv2("household_power_consumption.txt",dec=".",na.strings = "?")
power.consump.data$Date<-as.Date(power.consump.data$Date,format="%d/%m/%Y")
power.consump.data <- subset(power.consump.data,Date>="2007-02-01" & Date<="2007-02-02")
power.consump.data$Time <- paste(power.consump.data$Date,power.consump.data$Time, sep=" ")
power.consump.data$Time<-strptime(power.consump.data$Time,format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
with(power.consump.data,plot(Time,Global_active_power,
                             type = "l",
                             ylab = "Global Active Power",
                             xlab = "")
)
with(power.consump.data,plot(Time,Voltage,
                             type = "l",
                             ylab = "Voltage",
                             xlab = "datetime")
)
with(power.consump.data,plot(Time,Sub_metering_1,
                             type = "n",
                             ylab = "Energy sub metering",
                             xlab = "")
)
with(power.consump.data,lines(Time,Sub_metering_1,
                              col = "black")
)
with(power.consump.data,lines(Time,Sub_metering_2,
                              col = "red")
)

with(power.consump.data,lines(Time,Sub_metering_3,
                              col = "blue")
)
legend("topright",col=c("black","red","blue"),lty=7,bty="n",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(power.consump.data,plot(Time,Global_reactive_power,
                             type = "l",
                             ylab = "Global_reactive_power",
                             xlab = "datetime")
)

dev.off()
