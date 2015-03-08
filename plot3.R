library(dplyr)
library(lubridate)


data<-read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings="?",colClasses="character",stringsAsFactors=FALSE)

cran<-tbl_df(data)
mehvesh<-filter(cran,Date=="1/2/2007"|Date=="2/2/2007")
mehvi<-mutate(mehvesh,datentime=dmy(Date)+hms(Time))
x<-as.POSIXlt(mehvi$datentime)
rabia<-cbind(mehvi,x)
with(rabia,plot(x,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(rabia,lines(x,Sub_metering_1))
with(rabia,lines(x,Sub_metering_2,col="red"))
with(rabia,lines(x,Sub_metering_3,col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png")
dev.off()