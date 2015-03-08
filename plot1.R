library(dplyr)
library(lubridate)


data<-read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings="?",colClasses="character",stringsAsFactors=FALSE)

cran<-tbl_df(data)
mehvesh<-filter(cran,Date=="1/2/2007"|Date=="2/2/2007")
mehvi<-mutate(mehvesh,datentime=dmy(Date)+hms(Time))
hist(mehvi$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency",main="Global Active Power")
dev.copy(png,file="plot1.png")
dev.off()