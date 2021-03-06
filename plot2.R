setwd("/Users/bim/Documents/Personal/Coursera/Exploratory Data Analysis SU14/CourseProject1/ExData_Plotting1")  ## My project directory

## Get data, only for Feb 1&2, 2007
dat<-read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F,sep=';',na.strings = "?")
names(dat)<-names(read.table("household_power_consumption.txt",header=T,sep=';',nrow=1))

## Combine and transform the date and time fields
datetime<-paste(dat$Date,dat$Time)
dat$datetime<-as.POSIXct(strptime(datetime,format="%d/%m/%Y %H:%M:%S"))

## Export plot as .png
png("plot2.png", width=480, height=480)
plot(dat$Global_active_power ~ dat$datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
