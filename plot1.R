### Put the file name with location exactly while reading the file.
power.data <- read.table("D:\\Coresera Courses\\Exploratory analysis in R\\household_power_consumption.txt", header = TRUE,sep = ";")
data <- split(power.data, power.data$Date)
power.data.new <- rbind(data$`1/2/2007`, data$`2/2/2007`)

### Plot 1

power.data.new$Global_active_power <- as.numeric(power.data.new$Global_active_power)

png("D:\\Coresera Courses\\Exploratory analysis in R\\plot1.png"
    , width= 480, height = 480, units = "px")
hist(power.data.new$Global_active_power/500
     , main= "Global Active Power"
     , xlab = "Global Active Power(kilowatts)"
     , col = "red")

dev.off()
