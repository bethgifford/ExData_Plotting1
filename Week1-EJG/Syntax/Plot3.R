#Set working directory
setwd("/Users/ejg141/Dropbox/Work-Related/Coursera-Practical Data Mining/ExploratoryDataAnalysis/Course-Repo/ExData_Plotting1/Week1-EJG/")
library(lubridate)
# Step 1. Get Data from course website
if (!file.exists("./data/household_power_consumption.txt")) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./temp_data/exdata%2Fdata%2Fhousehold_power_consumption.zip", method = "wget")
    unzip("./temp_data/exdata%2Fdata%2Fhousehold_power_consumption.zip", overwrite = T, exdir = "./data")
}

# Step 2 Load Data for Plots
#Only using data from 2007-02-01 and 2007-02-02.
#Ideally, I would just read in relevant times
energy = read.table("./data/household_power_consumption.txt",
sep=";", header=TRUE, na.strings=c("?"))
energy2<-energy[which(energy$Date=="1/2/2007" | energy$Date=="2/2/2007"), ]
energy2$Date<-dmy( energy2$Date)
energy2$Day<-weekdays(energy2$Date)
energy2$DateTime<- as.POSIXct(paste(energy2$Date, energy2$Time))


#Plot 3 Line chart with 1 line for each sub meter
  png(file="./Plots/plot3.png",  width = 480, height = 480, units="px")
    par(mfrow=c(1,1))
    with(energy2, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", ylab="Energy sub metering")})
    lines(energy2$Sub_metering_2 ~ energy2$DateTime, col = 'Red')
    lines(energy2$Sub_metering_3 ~ energy2$DateTime, col = 'Blue')
    legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
