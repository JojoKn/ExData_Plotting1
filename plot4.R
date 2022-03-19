household_power_consumption <- read.csv("~/Desktop/Learning R/ExData_Plotting1/household_power_consumption.txt", sep=";")

str(household_power_consumption)
household_power_consumption$Date<-as.Date(household_power_consumption$Date, format="%d/%m/%Y")


power<-household_power_consumption[(household_power_consumption$Date=="2007-02-01" | 
                                      household_power_consumption$Date=="2007-02-02"),]

power$Global_active_power<-as.numeric(power$Global_active_power)
power$datetime=paste(power$Date, power$Time, sep=" ") 
power$datetime<-strptime(power$datetime, format="%Y-%m-%d %H:%M:%S")

png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

with(power, plot(datetime,Global_active_power,
                 type="l",
                 ylab="Global Active Power",
                 xlab=" "))


with(power, plot(datetime, Voltage,
                 type="l",
                 ylab="Voltage",
                 xlab="datetime"))


with(power, plot(datetime, Sub_metering_1, 
                 type="l",
                 ylab="Energy sub metering",
                 xlab=" "))
with(power, lines(datetime, Sub_metering_2, 
                  type="l",
                  col="red"))
with(power, lines(datetime, Sub_metering_3,
                  type="l",
                  col="blue"))
legend("topright", 
       lty=1,
       lwd=2,
       col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


with(power, plot(datetime, Global_reactive_power,
                 type="l",
                 ylab="Global_reactive_power",
                 xlab="datetime"))

dev.off()
