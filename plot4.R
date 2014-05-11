#
# plot4.R
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
png( "figure/plot4.png",
     width = 480, height = 480 )
par( mfrow= c( 2, 2 ) )

# top left
plot( hd$DateTime, hd$Global_active_power,
      ylab = "Global Active Power",
      xlab = "",
      xaxt = "n",
      type = "l" )
seqDates <-  seq( min( hd$DateTime ), tail( hd$DateTime, 1 ) + 60, by = "days" )
axis.POSIXct( side = 1, seqDates, at = seqDates, format = "%a" )

# top right
plot( hd$DateTime, hd$Voltage,
      ylab = "Voltage",
      xlab = "datetime",
      xaxt = "n",
      type = "l" )
axis.POSIXct( side = 1, seqDates, at = seqDates, format = "%a" )

# bottom left
plot( hd$DateTime, hd$Sub_metering_1,
      ylab = "Energy sub metering",
      xlab = "",
      xaxt = "n",
      col = "black",
      type = "l" )
points( hd$DateTime, hd$Sub_metering_2,
        col = "red",
        type = "l" )
points( hd$DateTime, hd$Sub_metering_3,
        col = "blue",
        type = "l" )
axis.POSIXct( side = 1, seqDates, at = seqDates, format = "%a" )
legend( "topright",
        col = c( "black", "red", "blue" ),
        bty = "n",
        lty = c( 1, 1, 1 ),
        legend = c( "Sub_metering_1",
                    "Sub_metering_2",
                    "Sub_metering_3" ) )

# bottom right
plot( hd$DateTime, hd$Global_reactive_power,
      ylab = "Global_reactive_power",
      xlab = "datetime",
      xaxt = "n",
      type = "l" )
axis.POSIXct( side = 1, seqDates, at = seqDates, format = "%a" )

dev.off()
