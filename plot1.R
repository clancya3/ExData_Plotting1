#Reading in the data

setwd("C:/Users/kevin/Desktop/Coursera/Exploratory Data Analysis/Week 1")
house <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", header = TRUE, na.strings = "?", dec = ".")
#missing data denoted as ?

#changing date format
house$Date <- as.Date(house$Date, format = "%d/%m/%Y")

#subsetting data to be Feb 1 and Feb 2 2007

housesub <- subset(house, Date == "2007-02-01" | Date == "2007-02-02")

#Plot 1
#Sending to png file
png("plot1.png", width = 480, height = 480)

#Making the histogram
hist(housesub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Turning graphic device off
dev.off()
