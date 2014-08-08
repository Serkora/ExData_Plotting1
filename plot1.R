#Read all the data. 
#Assumes you have the file with the same name in your working directory
ordata<-read.table("household_power_consumption.txt",sep=";",
                   stringsAsFactors=FALSE,header=TRUE)
# Subset two days we are interested in
data<-ordata[ordata$Date %in% c("1/2/2007","2/2/2007"),]


## Graph 1

#open the png graphics devices
#required width/height is default, so no need to specify it
png(file="plot1.png",bg="transparent")

#Just a histogram of global active power. 
#Specifying the column, y-axis limits (just in case), x-axis label and a title.
#x-axis limits are omitted, because the reference graphs only had ticks up to 6,
#but the histogram continues further.
hist(as.numeric(data[,"Global_active_power"]),col="red",ylim=c(0,1200),
     xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")

#close the device and save
dev.off()