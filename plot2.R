#Read all the data. 
#Assumes you have the file with the same name in your working directory
ordata<-read.table("household_power_consumption.txt",sep=";",
                   stringsAsFactors=FALSE,header=TRUE)
# Subset two days we are interested in
data<-ordata[ordata$Date %in% c("1/2/2007","2/2/2007"),]


## Graph 2

#open the png graphics devices
#required width/height is default, so no need to specify it
png(file="plot2.png",bg="transparent")

#plot the global active power as a lineplot
#specifying ranges, titles, labes etc, 
#also removing the x-axis ticks
plot(as.numeric(data[,"Global_active_power"]),type="l",xlab="",
     ylab="Global Active Power (kilowatts)",xaxt="n")

#find last point of the data (next one would correspond to the start of saturday)
#create x-axis ticks at 0, middle and (length+1) points of graph
ll<-as.numeric(length(data[,"Global_active_power"]))
axis(1, at = c(0, ll/2+1, ll+1),labels=c("Thu","Fri","Sat"))

#close the device and save
dev.off()