power.consump.data<-read.csv2("household_power_consumption.txt",dec=".",na.strings = "?")
power.consump.data$Date<-as.Date(power.consump.data$Date,format="%d/%m/%Y")
power.consump.data <- subset(power.consump.data,Date>="2007-02-01" & Date<="2007-02-02")
power.consump.data$Time <- paste(power.consump.data$Date,power.consump.data$Time, sep=" ")
power.consump.data$Time<-strptime(power.consump.data$Time,format = "%Y-%m-%d %H:%M:%S")


