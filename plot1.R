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
##
## Plot Graphic #1 and print to PNG file
##    
  hist(dfsubset$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "Red", main = "Global Active Power", cex.lab = 0.90)
  dev.copy(png, file = "plot1.png", width = 480, height = 480)
  dev.off
  