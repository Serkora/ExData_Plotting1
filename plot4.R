#Read all the data. 
#Assumes you have the file with the same name in your working directory
ordata<-read.table("household_power_consumption.txt",sep=";",
                   stringsAsFactors=FALSE,header=TRUE)
# Subset two days we are interested in
data<-ordata[ordata$Date %in% c("1/2/2007","2/2/2007"),]


## Graph 4

#open the png graphics devices
#required width/height is default, so no need to specify it
png(file="plot4.png",bg="transparent")

#create 2x2 box for graphs
par(mfrow=c(2,2))

#First graph. Code is basically copypasted from plot2.R, so comments are omitted
plot(as.numeric(data[,"Global_active_power"]),type="l",xlab="",
     ylab="Global Active Power",xaxt="n")
ll<-as.numeric(length(data[,"Global_active_power"]))
axis(1, at = seq(0, ll+1, by = ll/2),labels=c("Thu","Fri","Sat"))

#Second 
plot(as.numeric(data[,"Voltage"]),type="l",xlab="datetime",ylab="Voltage",xaxt="n")
axis(1, at = seq(0, ll+1, by = ll/2),labels=c("Thu","Fri","Sat"))

#Third. Again, total copy of plot3.R without the comments
ind<-c(max(as.numeric(data[,"Sub_metering_1"])),max(as.numeric(data[,"Sub_metering_2"])),max(as.numeric(data[,"Sub_metering_3"])))
mc<-which.max(ind)
col1<-paste("Sub_metering_",mc,sep="")
z=2;
for (i in 1:length(ind)) {
    if (i==mc) next
    colnam<-paste("col",z,sep="")
    assign(colnam,paste("Sub_metering_",i,sep=""))
    z=z+1
}
#end of optional code
plot(as.numeric(data[,col1]),type="l",col="black",
     ylab="Energy sub metering",xlab="",xaxt="n")
lines(as.numeric(data[,col2]),type="l",col="red",xaxt="n")
lines(as.numeric(data[,col3]),type="l",col="blue",xaxt="n")
axis(1, at = seq(0, ll+1, by = ll/2),labels=c("Thu","Fri","Sat"))
lgnd<-c(col1,col2,col3)
legend("topright",legend=lgnd,lty=c(1,1,1),col=c("black","red","blue"))

#Fourth
plot(as.numeric(data[,"Global_reactive_power"]),type="l",xlab="datetime",ylab="Global_reactive_power",xaxt="n")
axis(1, at = seq(0, ll+1, by = ll/2),labels=c("Thu","Fri","Sat"))

#close the device and save
dev.off()