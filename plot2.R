### Put the file name with location exactly while reading the file.
power.data <- read.table("D:\\Coresera Courses\\Exploratory analysis in R\\household_power_consumption.txt", header = TRUE,sep = ";")
data <- split(power.data, power.data$Date)
power.data.new <- rbind(data$`1/2/2007`, data$`2/2/2007`)

### Plot 2
power.data.new$Global_active_power <- as.numeric(power.data.new$Global_active_power)
png("D:\\Coresera Courses\\Exploratory analysis in R\\plot2.png"
    , width= 480, height = 480, units = "px")
plot(power.data.new$Global_active_power/500
     , type = "l"
     , xlab = NA
     , ylab = "Global Active Power (kilowatts)"
     , xaxt='n')
time.length <- length(power.data.new$Global_active_power)
axis(side=1,at=c(1,time.length/2+1,time.length),labels=c("Thu","Fri","Sat"))

dev.off()
