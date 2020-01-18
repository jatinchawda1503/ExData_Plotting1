################Reading the data########################

readfile<- read.table("household_power_consumption.txt",sep=";", header=T, stringsAsFactors=F,check.names=F, dec=".", na.strings="?",comment.char="", quote='\"')

###############Subsetiing Date####################

subsetDate <- subset(readfile, Date %in% c("1/2/2007","2/2/2007"))

##########converting the Date variables to Date classes############ 
subsetDate$Date <- as.Date(subsetDate$Date, format="%d/%m/%Y")

#########converting the Time variables to Time classes######
date_time <- paste(as.Date(subsetDate$Date),subsetDate$Time)
subsetDate$Datetime <- as.POSIXct(date_time)

###########Converting Global_active_Power to numeric####
subsetDate$Global_active_power <- as.numeric(subsetDate$Global_active_power)

########Exporting Data as Png File in given size of 480X480####
png("plot2.png", width=480, height=480)

#############Plotting  the Data##############
plot(subsetDate$Datetime,subsetDate$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")



dev.off()
