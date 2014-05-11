#
# plot2.R
#
#

# Read data mergine date and time in a single column
hd <- read.table( "household_power_consumption.txt",
                  sep=";",
                  na.strings = "?",
                  header = TRUE )
hd <- hd[hd$Date %in% c( "1/2/2007", "2/2/2007" ),]
hd$DateTime <- strptime( paste( hd$Date, hd$Time, sep=" " ),
                         format = "%d/%m/%Y %H:%M:%S" )
hd$Date <- NULL
hd$Time <- NULL

# exercise
png( "figure/plot2.png",
     width = 480, height = 480 )
plot( hd$DateTime, hd$Global_active_power,
      ylab = "Global Active Power (kilowatts)",
      xlab = "",
      xaxt = "n",
      type = "l" )
seqDates <-  seq( min( hd$DateTime ), tail( hd$DateTime, 1 ) + 60, by = "days" )
axis.POSIXct( side = 1, seqDates, at = seqDates, format = "%a" )
dev.off()

