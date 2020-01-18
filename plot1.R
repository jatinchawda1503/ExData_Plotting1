################Reading the data########################

readfile<- read.table("household_power_consumption.txt",sep=";", header=T, stringsAsFactors=F,check.names=F, dec=".", na.strings="?",comment.char="", quote='\"')

###############Subsetiing Date####################

subsetDate <- subset(readfile, Date %in% c("1/2/2007","2/2/2007"))

##########converting the Date variables to Date classes############ 
subsetDate$Date <- as.Date(subsetDate$Date, format="%d/%m/%Y")

###########Converting Global_active_Power to numeric####
subsetDate$Global_active_power <- as.numeric(subsetDate$Global_active_power)

#############Plotting  the Data##############
hist(subsetDate$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

########Exporting Data as Png File in given size of 480X480####
png("plot1.png", width=480, height=480)
dev.off()
