setwd("/Users/bim/Documents/Personal/Coursera/Exploratory Data Analysis SU14/CourseProject1/ExData_Plotting1")  ## My project directory

## Get data, only for Feb 1&2, 2007
dat<-read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F,sep=';',na.strings = "?")
names(dat)<-names(read.table("household_power_consumption.txt",header=T,sep=';',nrow=1))

## Combine and transform the date and time fields
datetime<-paste(dat$Date,dat$Time)
dat$datetime<-as.POSIXct(strptime(datetime,format="%d/%m/%Y %H:%M:%S"))

## Export plots as .png
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
with(dat, {
        plot(Global_active_power ~ datetime, type="l", xlab="", ylab="Global Active Power")
        plot(Voltage ~ datetime, type="l")
        with(dat,plot(Sub_metering_2 ~ datetime, type="n", ylim=c(0,38), xlab="", ylab="Energy sub metering"))
        with(dat,points(Sub_metering_1 ~ datetime,type="l"))
        with(dat,points(Sub_metering_2 ~ datetime,type="l",col="red"))
        with(dat,points(Sub_metering_3 ~ datetime,type="l",col="blue"))
        legend("topright", col = c("black", "blue", "red"), lty=1, bty="n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power ~ datetime, type="l")
})
dev.off()
