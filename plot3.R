#Read all the data. 
#Assumes you have the file with the same name in your working directory
ordata<-read.table("household_power_consumption.txt",sep=";",
                   stringsAsFactors=FALSE,header=TRUE)
# Subset two days we are interested in
data<-ordata[ordata$Date %in% c("1/2/2007","2/2/2007"),]

## Graph 3

#open the png graphics devices
#required width/height is default, so no need to specify it
png(file="plot3.png",bg="transparent")

# just additional automatisation things, not really needed for the assigment
# although plot() and lines() functions do use the column names from this part
# so if the code is run, be sure not to omit this part
#find the column with the max value to use as the first graph,
#as it won't be resized after the second one is plotted
ind<-c(max(as.numeric(data[,"Sub_metering_1"])),max(as.numeric(data[,"Sub_metering_2"])),max(as.numeric(data[,"Sub_metering_3"])))
mc<-which.max(ind)
col1<-paste("Sub_metering_",mc,sep="")
#names of two other columns, to make plot() function neater
#names all the columns from 2 to n, skipping the one that's been used as the first
z=2;
for (i in 1:length(ind)) {
    if (i==mc) next
    colnam<-paste("col",z,sep="")
    assign(colnam,paste("Sub_metering_",i,sep=""))
    z=z+1
}
#end of optional code

#plot the first graph
plot(as.numeric(data[,col1]),type="l",col="black",
     ylab="Energy sub metering",xlab="",xaxt="n")
#plot two other graphs
lines(as.numeric(data[,col2]),type="l",col="red",xaxt="n")
lines(as.numeric(data[,col3]),type="l",col="blue",xaxt="n")

#as in the second plot, add x-axis ticks
ll<-as.numeric(length(data[,"Global_active_power"]))
axis(1, at = c(0, ll/2, ll+1),labels=c("Thu","Fri","Sat"))

#add legend
lgnd<-c(col1,col2,col3)
legend("topright",legend=lgnd,lty=c(1,1,1),col=c("black","red","blue"))


#close the device and save
dev.off()