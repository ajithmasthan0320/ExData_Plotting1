library("data.table")

setwd("D:/Axtria/Training/Data Science using R- Coursera/Github/Exploratory_Data_Analysis")

#Reading data
powerDT <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# Modifying variables
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Converting to date format
powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Dates of analysis 2007-02-01 and 2007-02-02
powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Plot 1
hist(powerDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
