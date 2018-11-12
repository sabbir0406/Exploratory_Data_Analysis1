### Put the file name with location exactly while reading the file.
power.data <- read.table("D:\\Coresera Courses\\Exploratory analysis in R\\household_power_consumption.txt", header = TRUE,sep = ";")
data <- split(power.data, power.data$Date)
power.data.new <- rbind(data$`1/2/2007`, data$`2/2/2007`)


### Plot 4

power.data.new$Sub_metering_1 <- as.numeric(power.data.new$Sub_metering_1)
power.data.new$Sub_metering_2 <- as.numeric(power.data.new$Sub_metering_2)
power.data.new$Sub_metering_3 <- as.numeric(power.data.new$Sub_metering_3)
power.data.new$Global_active_power <- as.numeric(power.data.new$Global_active_power)
power.data.new$Global_reactive_power <- as.numeric(power.data.new$Global_reactive_power)
power.data.new$Voltage <- as.numeric(power.data.new$Voltage)

png("D:\\Coresera Courses\\Exploratory analysis in R\\plot4.png"
    , width= 480, height = 480, units = "px")
par(mfrow=c(2,2), mar=c(4,4,3,2))
plot(power.data.new$Global_active_power/500
     , type = "l"
     , xlab = NA
     , ylab = "Global Active Power"
     , xaxt='n')
time.length <- length(power.data.new$Global_active_power)
axis(side=1,at=c(1,time.length/2+1,time.length),labels=c("Thu","Fri","Sat"))


plot(power.data.new$Voltage,
     type="l"
     ,xlab= "datetime"
     ,ylab= "Voltage"
     ,xaxt='n'
     ,yaxt='n'
     ,ylim = c(800,2300))
axis(side=1,at=c(1,time.length/2+1,time.length),labels=c("Thu","Fri","Sat"))
axis(side=2,at=c(1000,1200,1400,1600,1800,2000,2200)
     , labels = c("234","","238","","242","","246"))



plot(power.data.new$Sub_metering_1
     , type = "l"
     , xlab = NA
     , ylab = "Energy sub metering"
     , ylim = c(-2, 40)
     , xaxt='n'
     , yaxt='n')

time.length <- length(power.data.new$Global_active_power)
axis(side=1,at=c(1,time.length/2+1,time.length),labels=c("Thu","Fri","Sat"))
axis(side=2,at=c(0,10,20,30),labels=c("0","10","20","30"))

lines(power.data.new$Sub_metering_2, col="red")
lines(power.data.new$Sub_metering_3, col="blue")
legend("topright", col = c("black","red","blue")
       , lty=1, bty = "n"
       , legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))



plot(power.data.new$Global_reactive_power/(max(power.data.new$Global_reactive_power*2))
     ,type = "l"
     ,xaxt='n'
     ,ylab = "Global_reactive_power"
     ,xlab = "datetime")

time.length <- length(power.data.new$Global_active_power)
axis(side=1,at=c(1,time.length/2+1,time.length),labels=c("Thu","Fri","Sat"))

dev.off()

