#
# plot3.R
#
#

# Read data mergine date and time in a single column
hd <- read.table( "household_power_consumption.txt",
                  sep=";",
                  na.strings = "?",
                  nrows = 1000,
                  header = TRUE )
hd$DateTime <- strptime( paste( hd$Date, hd$Time, sep=" " ),
                         format = "%d/%m/%Y %H:%M:%S" )
hd$Date <- NULL
hd$Time <- NULL

# exercise
png( "plot3.png" )
plot( hd$DateTime, hd$Sub_metering_1,
      ylab = "Energy sub meering",
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
axis.Date( side = 1, hd$DateTime, format = "%a" )
legend( "topright",
        legend = c( "Sub_metering_1",
                    "Sub_metering_2",
                    "Sub_metering_3" ) )
dev.off()
