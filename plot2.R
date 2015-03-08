library(dplyr)
library(lubridate)


data<-read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings="?",colClasses="character",stringsAsFactors=FALSE)

cran<-tbl_df(data)
mehvesh<-filter(cran,Date=="1/2/2007"|Date=="2/2/2007")
mehvi<-mutate(mehvesh,datentime=dmy(Date)+hms(Time))
x<-as.POSIXlt(mehvi$datentime)
rabia<-cbind(mehvi,x)


with(rabia,plot(x,Global_active_power,ylab="Global Active Power(kilowatts)",xlab="",type="l"))
dev.copy(png,file="plot2.png")
dev.off()