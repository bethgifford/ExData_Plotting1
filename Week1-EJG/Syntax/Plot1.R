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


# Plot 1 Histogram

png(file="./Plots/plot1.png",  width = 480, height = 480, units="px")
par(mfrow=c(1,1))
hist(energy2$Global_active_power,  main="Global Active Power",    
     xlab="Global Active Powers (kilowatts)",     
     border="black",    
     col="red", xlim=c(0,6), ylim=c(0,1200)) 
dev.off()
/Users/ejg141/Dropbox/Work-Related/Coursera-Practical Data Mining/ExploratoryDataAnalysis/Course-Repo/ExData_Plotting1/Week1-EJG/Course-Syntax-Project1