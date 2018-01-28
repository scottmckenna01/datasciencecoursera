## Read in Power text file data and create 4 graphics
##
## setwd() and call Library(ies)
##
  setwd("C:/KCAlphaALL/Reposit/Scott/Coursera/Course4")
  library(plyr)
  library(dplyr)
  library(lubridate)
  library(data.table)
  library(datasets)
##
## Read text file data and subset for 2-day analyzed -- Feb 1-2, 2007
##  
  tempdf <- fread("household_power_consumption.txt", na.strings = "?")
  tempdf$Date <- as.Date(tempdf$Date, format = "%d/%m/%Y")
  dfsubset <- filter(tempdf, Date>"2007-01-31" & Date<"2007-02-03")
  dfsubset$DateTime <- paste(dfsubset$Date, dfsubset$Time)
  dfsubset$DateTime <- ymd_hms(dfsubset$DateTime)
  dfsubset$Day <- wday(dfsubset$DateTime)
##
## Plot Graphic #1 and print to PNG file
##    
  plot(dfsubset$DateTime, dfsubset$Sub_metering_1, pch = NA, lty = 1, xlab = "", ylab = "Energy sub metering")
  lines(dfsubset$DateTime, dfsubset$Sub_metering_1)
  points(dfsubset$DateTime, dfsubset$Sub_metering_2, col = "red", pch = NA, xlab = "", ylab = "Energy sub metering")
  lines(dfsubset$DateTime, dfsubset$Sub_metering_2, col = "red")
  points(dfsubset$DateTime, dfsubset$Sub_metering_3, col = "red", pch = NA, xlab = "", ylab = "Energy sub metering")
  lines(dfsubset$DateTime, dfsubset$Sub_metering_3, col = "blue")
  legend("topright", col = c("black", "red", "blue"), lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.60)
  dev.copy(png, file = "plot3.png", width = 480, height = 480)
  dev.off
