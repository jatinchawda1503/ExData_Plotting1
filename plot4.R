################Reading the data########################

readfile<- read.table("household_power_consumption.txt",sep=";", header=T, stringsAsFactors=F,check.names=F, dec=".", na.strings="?",comment.char="", quote='\"')

###############Subsetiing Date####################

subsetDate <- subset(readfile, Date %in% c("1/2/2007","2/2/2007"))

##########converting the Date variables to Date classes############ 
subsetDate$Date <- as.Date(subsetDate$Date, format="%d/%m/%Y")

#########converting the Time variables to Time classes######
date_time <- paste(as.Date(subsetDate$Date),subsetDate$Time)
subsetDate$Datetime <- as.POSIXct(date_time)

###########Converting Global_active_Power,Sub_metering_1,Sub_metering_2,Sub_metering_3 to numeric####
subsetDate$Global_active_power <- as.numeric(subsetDate$Global_active_power)
subsetDate$Sub_metering_1 <- as.numeric(subsetDate$Sub_metering_1)
subsetDate$Sub_metering_2 <- as.numeric(subsetDate$Sub_metering_2)
subsetDate$Sub_metering_3 <- as.numeric(subsetDate$Sub_metering_3)

########Exporting Data as Png File in given size of 480X480####
png("plot4.png", width=480, height=480)

#############Plotting  the Data##############
par(mfrow = c(2, 2)) 

plot(subsetDate$Datetime, subsetDate$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(subsetDate$Datetime,subsetDate$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(subsetDate$Datetime, subsetDate$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(subsetDate$Datetime, subsetDate$Sub_metering_2, type="l", col="red")
lines(subsetDate$Datetime, subsetDate$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(subsetDate$Datetime, subsetDate$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.off()
