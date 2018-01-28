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
  plot(dfsubset$DateTime, dfsubset$Global_active_power, pch = NA, xlab = "", ylab = "Global Active Power (killowatts)")
  lines(dfsubset$DateTime, dfsubset$Global_active_power)
  dev.copy(png, file = "plot2.png", width = 480, height = 480)
  dev.off
