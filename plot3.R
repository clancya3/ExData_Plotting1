#Plot 3

#Reading in the data

setwd("C:/Users/kevin/Desktop/Coursera/Exploratory Data Analysis/Week 1")
house <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", header = TRUE, na.strings = "?", dec = ".")
#missing data denoted as ?

#changing date column to date type
house$Date <- as.Date(house$Date, format = "%d/%m/%Y")

#subsetting data to be Feb 1 and Feb 2 2007

housesub <- subset(house, Date >= "2007-02-01" & Date <= "2007-02-02")

#Sending to png file
png("plot3.png", width = 480, height = 480)

#Creating column in table with date and time merged together
DayTime <- strptime(paste(housesub$Date,housesub$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")
TimeData <- cbind(housesub, DayTime)


#need to separate points into three parts (sub_metering1,2,3; all with different colors)
##setting the plot with the first y group (submetering 1)
plot(TimeData$DayTime,TimeData$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
#adding the two other lines
lines(TimeData$DayTime, TimeData$Sub_metering_2, col = "red")
lines(TimeData$DayTime, TimeData$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2)

#Turning graphic device off
dev.off()