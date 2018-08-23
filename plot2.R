#Reading in the data

setwd("C:/Users/kevin/Desktop/Coursera/Exploratory Data Analysis/Week 1")
house <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", header = TRUE, na.strings = "?", dec = ".")
#missing data denoted as ?

#changing date column to date type
house$Date <- as.Date(house$Date, format = "%d/%m/%Y")

#subsetting data to be Feb 1 and Feb 2 2007

housesub <- subset(house, Date >= "2007-02-01" & Date <= "2007-02-02")

#Plot 2
#Sending to png file
png("plot2.png", width = 480, height = 480)

#Creating column in table with date and time merged together
DayTime <- strptime(paste(housesub$Date,housesub$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")
TimeData <- cbind(housesub, DayTime)


plot(TimeData$DayTime, housesub$Global_active_power, type = "l", ylab = "Global Actice Power (kilowatts)", xlab = "")

#Turning graphic device off
dev.off()