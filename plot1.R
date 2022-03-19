household_power_consumption <- read.csv("~/Desktop/Learning R/ExData_Plotting1/household_power_consumption.txt", sep=";")

household_power_consumption$Date<-as.Date(household_power_consumption$Date, format="%d/%m/%Y")

str(household_power_consumption)

power<-household_power_consumption[(household_power_consumption$Date=="2007-02-01" | 
                                      household_power_consumption$Date=="2007-02-02"),]

power$Global_active_power<-as.numeric(power$Global_active_power)

png("plot1.png", width = 480, height = 480)
with(power, hist(Global_active_power, col="red", 
                 xlab="Global Active Power (kilowatts)", 
                 ylab="Frequency",
                 main="Global Active Power"))
dev.off()
